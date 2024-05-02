import 'package:cal_ads_admin/utils/color_constant.dart';
import 'package:cal_ads_admin/utils/custom_alert_dialog.dart';
import 'package:cal_ads_admin/utils/custom_button.dart';
import 'package:cal_ads_admin/utils/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pricePerMonthController =
      TextEditingController();
  final TextEditingController _taxiNumberController = TextEditingController();
  final TextEditingController _bottlePriceController = TextEditingController();
  String? selectedType, selectBillboard;
  List<String> typeOfAd = [
    'Billboard',
    'Taxi Top Media',
    'Billboard in mall',
    'Free water adv',
  ];
  List<String> typeOfBillboard = [
    'Bulletine Billboard',
    'Poster Billboard',
    'Junior poster Billboard',
    'Digital Billboard',
  ];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create ad",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Colorconstant.secondarycolor),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropDownMenu(
                  dataList: typeOfAd,
                  label: 'Select Type',
                  onSelected: (select) {
                    selectedType = select;
                    setState(() {});
                  },
                ),
                if (selectedType == 'Billboard' ||
                    selectedType == 'Taxi Top Media' ||
                    selectedType == 'Free water adv')
                  const SizedBox(
                    height: 20,
                  ),
                if (selectedType == 'Free water adv')
                  TextFormField(
                    controller: _bottlePriceController,
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colorconstant.primerycolor,
                              ),
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Price per Bottle',
                    ),
                  ),
                if (selectedType == 'Billboard')
                  CustomDropDownMenu(
                    dataList: typeOfBillboard,
                    label: 'Select Billboard',
                    onSelected: (select) {
                      selectBillboard = select;
                    },
                  ),
                if (selectedType == 'Taxi Top Media')
                  TextFormField(
                    controller: _taxiNumberController,
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colorconstant.primerycolor,
                              ),
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Taxi Number',
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _locationController,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colorconstant.primerycolor,
                        ),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Add Locaation',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (selectedType != 'Free water adv')
                  TextFormField(
                    controller: _pricePerMonthController,
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colorconstant.primerycolor,
                              ),
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Price per Month',
                    ),
                  ),
                if (selectedType != 'Free water adv')
                  const SizedBox(
                    height: 20,
                  ),
                CustomButton(
                  label: "Add",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        if (selectedType == 'Billboard') {
                          await FirebaseFirestore.instance
                              .collection('ads')
                              .add({
                                'Type': selectedType,
                                'Billboard': selectBillboard,
                                'location': _locationController.text.trim(),
                                'price_per_month':
                                    _pricePerMonthController.text.trim(),
                              })
                              .then((value) => Navigator.pop(context))
                              .onError(
                                (error, stackTrace) => const CustomAlertDialog(
                                    title: 'Error',
                                    label: "something went wrong"),
                              );
                        }
                        if (selectedType == 'Free water adv') {
                          await FirebaseFirestore.instance
                              .collection('ads')
                              .add({
                                'Type': selectedType,
                                'location': _locationController.text.trim(),
                                'bottle_price':
                                    _bottlePriceController.text.trim(),
                              })
                              .then(
                                (value) => Navigator.pop(context),
                              )
                              .onError(
                                (error, stackTrace) => const CustomAlertDialog(
                                    title: 'Error',
                                    label: "something went wrong"),
                              );
                        }
                        if (selectedType == 'Taxi Top Media') {
                          await FirebaseFirestore.instance
                              .collection('ads')
                              .add({
                                'Type': selectedType,
                                'taxi_number':
                                    _taxiNumberController.text.trim(),
                                'location': _locationController.text.trim(),
                                'price_per_month':
                                    _pricePerMonthController.text.trim(),
                              })
                              .then((value) => Navigator.pop(context))
                              .onError(
                                (error, stackTrace) => const CustomAlertDialog(
                                    title: 'Error',
                                    label: "something went wrong"),
                              );
                        }
                        if (selectedType == 'Billboard in mall') {
                          await FirebaseFirestore.instance
                              .collection('ads')
                              .add({
                                'Type': selectedType,
                                'location': _locationController.text.trim(),
                                'price_per_month':
                                    _pricePerMonthController.text.trim(),
                              })
                              .then((value) => Navigator.pop(context))
                              .onError(
                                (error, stackTrace) => const CustomAlertDialog(
                                    title: 'Error',
                                    label: "something went wrong"),
                              );
                        }
                      } catch (e) {
                        return CustomAlertDialog(
                            title: "error", label: "error==$e");
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
