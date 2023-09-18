import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/features/welcome/presentation/screens/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const GetStartedScreen(),
    );
  }
}
