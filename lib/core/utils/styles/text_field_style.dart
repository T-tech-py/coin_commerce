import 'package:flutter/material.dart';

import '../colors.dart';




InputDecoration textFieldDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      color: AppColor.primaryHighContrast,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.primaryDark,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.primaryColor,
      ),
    ),
  );
}

textFieldTextStyle() {
  return TextStyle(
    color: AppColor.darkGrey,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}
