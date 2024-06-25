import 'package:flutter/material.dart';

class OptionDialog extends StatelessWidget {
  final String? title;
  final String? description;
  // final List<Widget>? actions;
  final Map<String, dynamic>? buttonLabelValue;
  const OptionDialog({super.key, this.title, this.description, this.buttonLabelValue});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? ""),
      content: Text(description ?? ""),
      actions: buttonLabelValue != null
          ? [
              ...buttonLabelValue!.entries.map(
                (e) => TextButton(
                  onPressed: () {
                    Navigator.pop(context, e.value);
                  },
                  child: Text(e.key),
                ),
              ),
            ]
          : [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Ya"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("Tidak"),
              ),
            ],
    );
  }
}
