import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_constant.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

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
                onPressed: () {},
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
          const Wrap(
            runSpacing: 20,
            spacing: 20,
            children: [
              DashboardItem(),
              DashboardItem(),
              DashboardItem(),
              DashboardItem(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              color: Colorconstant.primerycolor,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable2(
                  columns: [
                    DataColumn(
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
                    DataColumn(
                      label: Text(
                        "Suggestion",
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
                        DataCell(Text('Location')),
                        DataCell(Text('Suggestion'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colorconstant.tertiarycolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Text(
              "Total Active Billboard",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: Colorconstant.primerycolor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "10",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: Colorconstant.primerycolor),
            ),
          ],
        ),
      ),
    );
  }
}
