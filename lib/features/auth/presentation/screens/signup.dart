import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isWoman = true;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Pallete.secondaryLight.withOpacity(.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              icon: const Icon(Icons.keyboard_double_arrow_right),
              label: const Text('Skip')),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              vSpacing(5),
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
              Center(
                  child: heading2(
                "SIGN UP",
              )),
              vSpacing(7),
              body1('Fill the form below correctly to register',
                  customStyle: TextStyle(color: Pallete.secondary)),
              vSpacing(12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Pallete.textPrimary)),
                      labelText: 'First Name',
                    ),
                  ),
                  vSpacing(20.0),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Pallete.textPrimary)),
                      labelText: 'Last Name',
                    ),
                  ),
                  vSpacing(20.0),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Pallete.textPrimary)),
                      labelText: 'Email',
                    ),
                  ),
                  vSpacing(20.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  vSpacing(20.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                  vSpacing(20.0),
                  body1('What is your gender',
                      customStyle: TextStyle(color: Pallete.secondary)),
                  vSpacing(5),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isWoman = !isWoman;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              body1('Man',
                                  customStyle:
                                      TextStyle(color: Pallete.secondary)),
                              Checkbox(
                                checkColor: Colors.white,
                                value: !isWoman,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isWoman = !isWoman;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      hSpacing(20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isWoman = !isWoman;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              body1('Woman',
                                  customStyle:
                                      TextStyle(color: Pallete.secondary)),
                              Checkbox(
                                checkColor: Colors.white,
                                value: isWoman,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isWoman = !isWoman;
                                  });
                                },
                              ),
                            ],
                          ),
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
                    child: body1('Sign up',
                        customStyle: const TextStyle(color: Colors.white)),
                  ),
                  vSpacing(26),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
