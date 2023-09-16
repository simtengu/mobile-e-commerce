import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class GetStartedTwoScreen extends StatelessWidget {
  const GetStartedTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("${AppConstants.imgPath}productSearch.png"),
        vSpacing(10),
        heading3('Find products easily'),
        vSpacing(7),
        body1(
            'You just need to search or apply different product filters of your choice',
            isCentered: true),
      ],
    );
  }
}
