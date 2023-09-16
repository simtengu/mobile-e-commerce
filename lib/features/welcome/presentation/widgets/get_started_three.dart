import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class GetStartedThreeScreen extends StatelessWidget {
  const GetStartedThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("${AppConstants.imgPath}payment.png"),
        vSpacing(10),
        heading3('Payment is easy'),
        vSpacing(7),
        body1(
            'You can easily pay with you credit card in a short period of time',
            isCentered: true),
      ],
    );
  }
}
