import 'package:cal_ads_admin/utils/color_constant.dart';
import 'package:cal_ads_admin/utils/custom_alert_dialog.dart';
import 'package:cal_ads_admin/utils/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSuggestion extends StatefulWidget {
  const UserSuggestion({super.key});

  @override
  State<UserSuggestion> createState() => _UserSuggestionState();
}

class _UserSuggestionState extends State<UserSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Contact Us",
                style: GoogleFonts.poppins(
                  textStyle:
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colorconstant.tertiarycolor,
                            fontWeight: FontWeight.w600,
                          ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colorconstant.tertiarycolor,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Divider(
            height: 20,
          ),
          FutureBuilder(
            future: FirebaseFirestore.instance.collection('contact_us').get(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final List<QueryDocumentSnapshot> documents =
                    snapshot.data!.docs;
                return Expanded(
                  child: ListView.separated(
                    itemCount: documents.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colorconstant.primerycolor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    documents[index]['title'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    documents[index]['email'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  const Spacer(),
                                  CustomButton(
                                    label: "Done",
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('contact_us')
                                          .doc()
                                          .delete()
                                          .then((value) {
                                        setState(() {});
                                      }).onError(
                                        (error, stackTrace) => showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const CustomAlertDialog(
                                                  title: 'error',
                                                  label:
                                                      'Something went wrong'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                documents[index]['description'],
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
