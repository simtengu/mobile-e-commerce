import 'package:flutter/material.dart';
import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/login_with_fb.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/login_with_google.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/signup.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            vSpacing(50),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage:
                    AssetImage("${AppConstants.imgPath}profile.png"),
              ),
            ),
            vSpacing(7),
            heading2("LOGIN"),
            vSpacing(7),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Pallete.textPrimary)),
                      hintText: 'Email',
                      icon: const Icon(Icons.email),
                    ),
                  ),
                  vSpacing(20.0),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  vSpacing(20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const SignUpScreen()));
                        },
                        child: const Text(
                          "I don't have an account",
                        ),
                      ),
                      
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                        ),
                      ),
                    ],
                  ),
                  vSpacing(20.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    child: const Text('Login'),
                  ),
                  vSpacing(26),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: _size.width * .38,
                          height: 1,
                          color: Pallete.textPrimary,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Pallete.secondaryLight,
                          ),
                          child: body1("OR",
                              customStyle: TextStyle(
                                  color: Pallete.secondary.withOpacity(.7))),
                        ),
                        const Spacer(),
                        Container(
                          width: _size.width * .38,
                          height: 1,
                          color: Pallete.textPrimary,
                        ),
                      ],
                    ),
                  ),
                  vSpacing(26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Expanded(child: LoginWithFbButton()),
                      hSpacing(10),
                      const Expanded(child: LoginWithGoogleButton()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
