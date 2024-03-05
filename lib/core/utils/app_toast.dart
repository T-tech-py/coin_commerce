
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'colors.dart';

class AppToast {
  static void showSuccessToast({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(milliseconds: 2000),
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: AppColor.success.withOpacity(0.88),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.greenAccent),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: context.appTheme.textTheme.bodyMedium!.copyWith(
              color: AppColor.white,
              fontSize: 14,
              letterSpacing: 0.1,
            ),
          ),
        ),
      ),
    );
  }

  static void showErrorToast({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.lerp(
           AppColor.red25,
           AppColor.white,
          0.3,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        elevation: 0,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: context.appTheme.textTheme.bodyMedium!.copyWith(
            color:  AppColor.white,
            fontSize: 14,
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }

  static void showWarningToast({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color.lerp(
           AppColor.orange,
           AppColor.white,
         0.1,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        elevation: 0,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: context.appTheme.textTheme.bodyMedium!.copyWith(
            color:  AppColor.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }
}
loadingDialog(BuildContext context) {
  return showAdaptiveDialog(
    barrierColor: Colors.black.withOpacity(.5),
    context: context,
    builder: (context) => Material(
      color: Colors.transparent,
      child: PopScope(
        canPop: false,
        child: Center(
          child: Container(
            height: 135,
            width: 135,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitSpinningLines(
                  color: Colors.indigo,
                  size: 55,
                ),
                Text("Loading..."),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
