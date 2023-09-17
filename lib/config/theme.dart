import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff8e5f43)),
    useMaterial3: true,
    textTheme: GoogleFonts.rubikTextTheme(),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Pallete.secondary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Pallete.primaryDark,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Pallete.textPrimary)),
    ),
  );
}

class Pallete {
  static Color primary = const Color(0xff8e5f43);
  static Color textPrimary = const Color.fromARGB(255, 176, 177, 179);
  static Color primaryDark = const Color(0xff63462f);
  static Color primaryLight = const Color(0xffe8dfd9);
  static Color secondary = const Color(0xff5e438e);
  static Color secondaryLight = const Color(0xffc9c0da);
  static Color success = const Color(0xff668e43);
  static Color successDark = const Color(0xff47632f);
}
