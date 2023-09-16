import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class GetStartedOneScreen extends StatelessWidget {
  const GetStartedOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("${AppConstants.imgPath}shop.png"),
        vSpacing(10),
        heading3('Welcome to aos-shopping'),
        vSpacing(7),
        body1(
          'For the best and lovely shopping experience anytime, anywhere',
          isCentered: true,
        ),
      ],
    );
  }
}
