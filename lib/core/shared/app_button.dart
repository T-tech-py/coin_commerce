
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    required this.text,
    this.color, this.width,
    required this.onTap,  this.addBorder =false, this.isInactive = false,
    this.suffix, this.preffix, this.backgroundColor, this.border});
  final String text;
  final double? width;
  final Color? color;
  final Color? backgroundColor;
  final Widget? suffix;
  final Widget? preffix;
  final bool? border;
  final bool addBorder;
  final bool isInactive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap:isInactive? (){}: onTap,
      child: Container(
        height: 50,
        width:width,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(
              color:border != null? null:backgroundColor?? AppColor.primaryHighContrast,
              borderRadius: BorderRadius.circular(100),
             // border: border != null?Border.all(color: AppColor.lightBlue): null
            ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(preffix != null)
            preffix!,
            8.width,
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:color?? AppColor.white,
              ),
            ),
            8.width,
            if(suffix != null)
            suffix!,
          ],
        ),
      ),
    );
  }
}
