import 'package:cal_ads_admin/utils/color_constant.dart';
import 'package:cal_ads_admin/utils/custom_alert_dialog.dart';
import 'package:cal_ads_admin/view/active_ads.dart';
import 'package:cal_ads_admin/view/add_screen.dart';
import 'package:cal_ads_admin/view/available_ads.dart';
import 'package:cal_ads_admin/view/dashboard.dart';
import 'package:cal_ads_admin/view/login_screen.dart';
import 'package:cal_ads_admin/view/pending_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: Material(
              color: Colorconstant.tertiarycolor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Admin',
                      style: GoogleFonts.poppins(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colorconstant.primerycolor,
                                ),
                      ),
                    ),
                    const Spacer(),
                    DrawerItem(
                      label: 'Add Ads',
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const AddScreen());
                      },
                      iconData: Icons.add,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerItem(
                      iconData: Icons.dashboard,
                      label: 'Dashboard',
                      isActive: _tabController.index == 0,
                      onTap: () {
                        _tabController.animateTo(0);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerItem(
                      iconData: Icons.check_circle_outline,
                      label: 'Active ads',
                      isActive: _tabController.index == 1,
                      onTap: () {
                        _tabController.animateTo(1);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerItem(
                      iconData: Icons.pending_actions_outlined,
                      label: 'Pending ads',
                      isActive: _tabController.index == 2,
                      onTap: () {
                        _tabController.animateTo(2);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrawerItem(
                      iconData: Icons.receipt_long_outlined,
                      label: 'Available ads',
                      isActive: _tabController.index == 3,
                      onTap: () {
                        _tabController.animateTo(3);
                      },
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: 'Log Out',
                            label: "Are you sure?",
                            onLogout: () async {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .then(
                                    (value) => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                        (route) => false),
                                  )
                                  .onError(
                                    (error, stackTrace) =>
                                        const CustomAlertDialog(
                                            title: "Error",
                                            label: "Something went wrong"),
                                  );
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colorconstant.primerycolor,
                      ),
                      label: Text(
                        'Log out',
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colorconstant.primerycolor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: const [
                      DashBoard(),
                      ActiveAds(),
                      PendingAds(),
                      AvailableAds()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final Function() onTap;
  final bool isActive;
  final IconData iconData;
  const DrawerItem({
    super.key,
    required this.label,
    required this.onTap,
    this.isActive = false,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          isActive ? Colorconstant.primerycolor : Colorconstant.tertiarycolor,
      elevation: isActive ? 0 : 5,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 230),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: isActive
                      ? Colorconstant.tertiarycolor
                      : Colorconstant.primerycolor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: isActive
                                  ? Colorconstant.tertiarycolor
                                  : Colorconstant.primerycolor,
                            ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
