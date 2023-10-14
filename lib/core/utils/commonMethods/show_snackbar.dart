import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context,{required String content, Color bgColor = Colors.black87}){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: bgColor,
          content:
               Text(content),
        ),
      );


}