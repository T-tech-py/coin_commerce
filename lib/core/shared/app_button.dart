
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    required this.text,
    this.color, this.width,
    required this.onTap,  this.addBorder =false, this.isInactive = true,
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
        decoration:addBorder?
            BoxDecoration(
              color:border != null? null:backgroundColor?? AppColor.blueFF,
              borderRadius: BorderRadius.circular(6),
              border: border != null?Border.all(color: AppColor.lightBlue): null
            )
            : BoxDecoration(
          gradient: AppColor.gradientButton,
          // color:isInactive?
          //     AppColor.buttonInactiveColor
          //     :!addBorder? AppColor.buttonTextColor:
          //   AppColor.transparent,
          borderRadius: BorderRadius.circular(6),
          border:addBorder? Border.all(color: AppColor.transparent):
           Border.all(color:AppColor.transparent)
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
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
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
