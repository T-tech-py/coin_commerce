import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, required this.child, required this.isLoading});
final Widget child;
final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if(isLoading)
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColor.appDark.withOpacity(0.2),
          child:const SpinKitWaveSpinner(
            size: 60,
            waveColor: AppColor.primaryColor,
            trackColor: AppColor.textFieldColorBg,
            color: AppColor.primaryColor,) ,
        ),
      ],
    );
  }
}

class AppLoaderTwo extends StatelessWidget {
  const AppLoaderTwo({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SpinKitRing(color: AppColor.primaryColor,lineWidth: 2,size: 80,),
        16.height,
        Text('Please wait...',
          style: context.appTheme.textTheme.bodyMedium!.copyWith(
            color: AppColor.black,
            fontSize: 14,
          ),),
      ],
    );
  }
}
