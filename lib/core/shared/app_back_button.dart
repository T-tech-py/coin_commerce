import 'dart:io';

import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap});
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap?? (){
        Navigator.pop(context);
      },
      child:const CustomImageWidget(imagePath: "assets/svgs/back.svg",
      width: 40,height: 40,),
    );
  }
}
