import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constant.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.dataList,
    required this.label,
    this.onSelected,
  });
  final String label;
  final List<String> dataList;
  final Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      requestFocusOnTap: false,
      enableSearch: false,
      width: 360,
      hintText: label,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colorconstant.tertiarycolor,
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(
          Colorconstant.secondarycolor,
        ),
      ),
      textStyle: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colorconstant.primerycolor,
            ),
      ),
      onSelected: onSelected,
      dropdownMenuEntries: List.generate(
        dataList.length,
        (index) => DropdownMenuEntry(
          value: dataList[index],
          label: dataList[index],
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colorconstant.primerycolor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
