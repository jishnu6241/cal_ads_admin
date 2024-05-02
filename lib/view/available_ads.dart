import 'package:cal_ads_admin/utils/availabel_billboard.dart';
import 'package:cal_ads_admin/utils/availabel_mall.dart';
import 'package:cal_ads_admin/utils/available_taxi.dart';
import 'package:cal_ads_admin/utils/available_water.dart';
import 'package:cal_ads_admin/utils/color_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableAds extends StatefulWidget {
  const AvailableAds({super.key});

  @override
  State<AvailableAds> createState() => _AvailableAdsState();
}

class _AvailableAdsState extends State<AvailableAds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                "Available Ads",
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
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('ads').get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<QueryDocumentSnapshot> documents =
                      snapshot.data!.docs;
                  return ListView.separated(
                    itemCount: documents.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      final doc =
                          documents[index].data() as Map<String, dynamic>;
                      if (doc['Type'] == 'Billboard') {
                        return AvailableBillboardBox(billboardData: doc);
                      } else if (doc['Type'] == 'Free water adv') {
                        return AvailableWaterBox(billboardData: doc);
                      } else if (doc['Type'] == 'Taxi Top Media') {
                        return AvailableTaxiBox(billboardData: doc);
                      } else {
                        return AvailableMallBox(billboardData: doc);
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
