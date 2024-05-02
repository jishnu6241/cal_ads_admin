import 'package:cal_ads_admin/utils/color_constant.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_screen.dart';

class ActiveAds extends StatelessWidget {
  const ActiveAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Active Ads",
                style: GoogleFonts.poppins(
                  textStyle:
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colorconstant.tertiarycolor,
                            fontWeight: FontWeight.w600,
                          ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.refresh,
                  color: Colorconstant.tertiarycolor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colorconstant.secondarycolor,
                  size: 25,
                  opticalSize: 30,
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
          ),
          Expanded(
            child: Material(
              color: Colorconstant.primerycolor,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: DataTable2(
                  columns: [
                    DataColumn2(
                      label: Text(
                        "Email",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colorconstant.secondarycolor),
                      ),
                    ),
                    DataColumn2(
                      label: Text(
                        "Category",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colorconstant.secondarycolor),
                      ),
                    ),
                    DataColumn2(
                      label: Text(
                        "Type",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colorconstant.secondarycolor),
                      ),
                    ),
                    DataColumn2(
                      label: Text(
                        "Duration",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colorconstant.secondarycolor),
                      ),
                    ),
                    DataColumn2(
                      label: Text(
                        "Fee",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colorconstant.secondarycolor),
                      ),
                      numeric: true,
                    ),
                    DataColumn2(
                      label: Text(
                        "Location",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colorconstant.secondarycolor),
                      ),
                      numeric: true,
                    ),
                  ],
                  rows: List<DataRow2>.generate(
                    20,
                    (index) => const DataRow2(
                      cells: [
                        DataCell(Text('joe@gmail.com')),
                        DataCell(Text('Billboard')),
                        DataCell(Text('Billboard in mall')),
                        DataCell(Text('1 Year')),
                        DataCell(Text('\$500')),
                        DataCell(Text('Location'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
