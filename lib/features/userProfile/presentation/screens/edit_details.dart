import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/vertical_spacing.dart';
import 'package:flutter/material.dart';

class EditDetailsScreen extends StatefulWidget {
  const EditDetailsScreen({super.key});

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  bool isWoman = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Details',
          style: TextStyle(
              color: Pallete.primaryDark, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20)
              .copyWith(bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                body1(
                  'First Name',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Pallete.textPrimary)),
                    labelText: 'First Name',
                  ),
                ),
                vSpacing(13),
                body1(
                  'Last Name',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Pallete.textPrimary)),
                    labelText: 'Last Name',
                  ),
                ),
                vSpacing(13),
                body1(
                  'Email',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Pallete.textPrimary)),
                    labelText: 'Email',
                  ),
                ),
                vSpacing(13),
                body1(
                  'Phone Number',
                  customStyle: TextStyle(color: Pallete.primary),
                ),
                vSpacing(10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Pallete.textPrimary)),
                    labelText: 'Phone',
                  ),
                ),
                vSpacing(15.0),
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
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: body1(
                    'Save Changes',
                    customStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
