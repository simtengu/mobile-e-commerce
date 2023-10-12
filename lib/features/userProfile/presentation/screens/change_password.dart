import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/config/theme.dart';

import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                body1(
                  'Previous Password',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Pallete.textPrimary),
                    ),
                    hintText: 'Enter previous password',
                  ),
                  obscureText: true,
                ),
                vSpacing(13),
                body1(
                  'New Password',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter new password',
                  ),
                  obscureText: true,
                ),
                vSpacing(13),
                body1(
                  'Confirm new password',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm new password',
                  ),
                  obscureText: true,
                ),
                vSpacing(50),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
