import 'package:e_commerce_app/config/theme.dart';
import 'package:flutter/material.dart';

class Loader {
  final BuildContext context;
  const Loader(this.context);

  startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Pallete.secondary,
              ),
            )
          ],
        );
      },
    );
  }

  stopLoading() {
    Navigator.of(context).pop();
  }
}
