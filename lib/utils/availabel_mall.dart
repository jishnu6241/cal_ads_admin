import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constant.dart';

class AvailableMallBox extends StatelessWidget {
  final Map<String, dynamic> billboardData;
  const AvailableMallBox({
    super.key,
    required this.billboardData,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colorconstant.primerycolor,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          runSpacing: 20,
          children: [
            Text(
              "Type :${billboardData['Type']}",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Text(
              "Location :${billboardData['location']}",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Text(
              "Price :${billboardData['price_per_month']}",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
