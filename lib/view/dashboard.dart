import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_constant.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int activeAds = 0, pendingAds = 0, feedback = 0, availableAds = 0;
  @override
  void initState() {
    super.initState();
    getCount();
  }

  Future<void> getCount() async {
    QuerySnapshot feedbackSnapsot =
        await FirebaseFirestore.instance.collection('contact_us').get();
    QuerySnapshot availableAdsSnapshot =
        await FirebaseFirestore.instance.collection('ads').get();
    QuerySnapshot pendingAdsSnapshot = await FirebaseFirestore.instance
        .collection('user_ads')
        .where('status', isEqualTo: 'pending')
        .get();
    QuerySnapshot activeSnapshot = await FirebaseFirestore.instance
        .collection('user_ads')
        .where('status', isEqualTo: 'active')
        .get();
    feedback = feedbackSnapsot.docs.length;
    availableAds = availableAdsSnapshot.docs.length;
    pendingAds = pendingAdsSnapshot.docs.length;
    activeAds = activeSnapshot.docs.length;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Dashboard",
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
            ],
          ),
          const Divider(
            height: 20,
          ),
          const Spacer(),
          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [
              DashboardItem(
                label: 'Available Ads',
                value: '$availableAds',
              ),
              DashboardItem(
                label: 'Pending Ads',
                value: '$pendingAds',
              ),
              DashboardItem(
                label: 'Active Ads',
                value: '$activeAds',
              ),
              DashboardItem(
                label: 'FeedBack',
                value: '$feedback',
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String label, value;
  const DashboardItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colorconstant.tertiarycolor,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Colorconstant.primerycolor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                    fontSize: 15, color: Colorconstant.primerycolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
