import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:flutter/material.dart';

class DialogCard extends StatelessWidget {
  final String title, content;
  final Color color;
  final IconData icon;
  const DialogCard(
      {super.key,
      required this.color,
      required this.content,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          vSpacing(6),
          heading4(
            title,
            customStyle: TextStyle(color: color),
          ),
          vSpacing(6),
          body1(content),
          vSpacing(15),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: heading4(
              'Close',
              customStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
