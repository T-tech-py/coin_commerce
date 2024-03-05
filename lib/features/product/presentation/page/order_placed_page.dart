import 'package:coin_commerce/core/shared/app_button.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/utils/app_navigator.dart';
import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/presentation/page/homepage.dart';
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatefulWidget {
  const OrderPlacedPage({super.key});
static const routeName = '/OrderPlacedPage';
  @override
  State<OrderPlacedPage> createState() => _OrderPlacedPageState();
}

class _OrderPlacedPageState extends State<OrderPlacedPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primaryHighContrast,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CustomImageWidget(imagePath: "assets/pngs/complete.png"),
          68.height,
          Container(
            height: 370,
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 29),
            decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Order Placed Successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),),
                //25.height,
                Text('You will receive an email confirmation',
                style: TextStyle(
                  color: AppColor.black.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),),
                
                AppButton(text: 'Done', onTap: (){popUntil(name: HomePage.routeName);}),

              ],
            ),
          )
        ],
      ),
    );
  }
}
