import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, label;
  final Function()? onLogout, onOk;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.label,
    this.onLogout,
    this.onOk,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(label),
      actions: [
        onLogout != null
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              )
            : const SizedBox(),
        onOk != null
            ? TextButton(
                onPressed: onOk,
                child: const Text("OK"),
              )
            : const SizedBox(),
        onLogout != null
            ? TextButton(
                onPressed: onLogout,
                child: const Text("Log out"),
              )
            : const SizedBox(),
      ],
    );
  }
}
