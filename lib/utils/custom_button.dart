import 'package:flutter/material.dart';

import 'color_constant.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colorconstant.secondarycolor,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colorconstant.primerycolor,
                ),
          ),
        ),
      ),
    );
  }
}
