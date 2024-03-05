import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColor.appDark,
   
    textTheme:  TextTheme(
      bodySmall:GoogleFonts.syne(
       
        fontWeight: FontWeight.w300,
        color: AppColor.white,
      ),
      bodyMedium: GoogleFonts.syne(
       
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
      bodyLarge: GoogleFonts.syne(
       
        fontWeight: FontWeight.w600,
        color: AppColor.white,
      ),
      headlineSmall: GoogleFonts.syne(
       
        fontWeight: FontWeight.w400,
        color: AppColor.primaryColor,
      ),
      headlineMedium: GoogleFonts.syne(
       
        fontWeight: FontWeight.w600,
        color: AppColor.primaryColor,
      ),
      headlineLarge: GoogleFonts.syne(
       
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColor,
      ),
      labelSmall: GoogleFonts.syne(
       
        fontWeight: FontWeight.w300,
        color: AppColor.grey81,
      ),
      labelMedium: GoogleFonts.syne(
       
        fontWeight: FontWeight.w400,
        color: AppColor.grey81,
      ),
      labelLarge: GoogleFonts.syne(
       
        fontWeight: FontWeight.bold,
        color: AppColor.grey81,
      ),
    ),
    brightness: Brightness.dark,
    buttonTheme:  const ButtonThemeData(
        buttonColor: AppColor.primaryColor,
        disabledColor: AppColor.red25,
        textTheme: ButtonTextTheme.primary
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColor.blackE1,
    )
);

ThemeData  get lightTheme => ThemeData(
  scaffoldBackgroundColor:AppColor.white ,
  //primaryColor: AppColor.primaryColor,
  iconTheme: const IconThemeData(color: AppColor.white),
  textTheme:  TextTheme(
    bodySmall:GoogleFonts.inter(
      //fontFamily: fontName,
      fontWeight: FontWeight.w300,
      color: AppColor.black,
    ),
    bodyMedium: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      color: AppColor.black,

    ),
    bodyLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      color: AppColor.black,
    ),
    headlineSmall: GoogleFonts.syne(
      fontWeight: FontWeight.w400,
      color: AppColor.primaryColor,
    ),
    headlineMedium: GoogleFonts.syne(
      fontWeight: FontWeight.w600,
      color: AppColor.primaryColor,
    ),
    headlineLarge: GoogleFonts.syne(
      fontWeight: FontWeight.bold,
      color: AppColor.primaryColor,
    ),
    labelSmall: GoogleFonts.syne(
      fontWeight: FontWeight.w300,
      color: AppColor.grey81,
    ),
    labelMedium: GoogleFonts.syne(
      fontWeight: FontWeight.w400,
      color: AppColor.grey81,
    ),
    labelLarge: GoogleFonts.syne(
     
      fontWeight: FontWeight.bold,
      color: AppColor.grey81,
    ),
  ),
  brightness: Brightness.light,
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith ((Set  states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColor.transparent;
      }
      return AppColor.primaryColor;
    }),
    checkColor: MaterialStateProperty.resolveWith ((Set  states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.transparent;
      }
      return AppColor.white;
    }),

  ),
  buttonTheme:  const ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      disabledColor: AppColor.red25,
      textTheme: ButtonTextTheme.primary
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.white,
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor
  )
  // inputDecorationTheme: const InputDecorationTheme(
  //
  // )
);