import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Pallete.secondaryLight.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Login with'),
          hSpacing(12),
          Image.asset(
            '${AppConstants.iconPath}google.png',
            width: 22,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
