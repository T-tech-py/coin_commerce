import 'package:coin_commerce/core/shared/app_back_button.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/ui/app_enums.dart';
import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});
  static const routeName = '/productDetailPage';
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(26),
          children: [
            const Row(
              children: [
                AppBackButton(),
                Spacer(),
                CustomImageWidget(imagePath: "assets/svgs/heart_fill.svg"),
              ],
            ),
            24.height,
            const CustomImageWidget(
              imagePath:
                  "https://www.realsimple.com/thmb/vDQYdFGqp9s_Gvr4wyCdFh0O8Ag=/4000x2667/filters:no_upscale()/how-to-clean-microfiber-cloth-GettyImages-1314720631-dfb583e54f9e40dea2fea26b6dfaf26f.jpg",
              width: double.infinity,
              height: 245,
            ),
            24.height,
            const Text(
              "Men's Harrington Jacket",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            8.height,
            const Text(
              "\$500",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColor.primaryHighContrast,
                  fontWeight: FontWeight.w600),
            ),
            24.height,
            const OptionCard(title: 'Quantity',type: AppProductType.size,),
            12.height,
            const OptionCard(title: 'Size',type: AppProductType.quantity,),
            24.height,
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w600
              ),
            ),
            15.height,
             Text(
              "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
              style: TextStyle(
                fontSize: 12,
                color: AppColor.black.withOpacity(0.5) ,
              ),
            ),
            24.height,
            const Text(
              "Reviews",
              style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w600
              ),
            ),
            10.height,
            const Text(
              "4.5 Ratings",
              style: TextStyle(
                fontSize: 18,
                color: AppColor.black ,
                  fontWeight: FontWeight.w500
              ),
            ),
            30.height,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( "\$500",
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w600,
                  color: AppColor.white,

                ),),
                Text( "Add to Cart",),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatefulWidget {
  const OptionCard({super.key, required this.title, required this.type});
  final String title;
  final AppProductType type;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xffF4F4F4),
      ),
      child: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          if (widget.type == AppProductType.quantity)
            Row(
              children: [
                FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: AppColor.primaryHighContrast,
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColor.white,
                  ),
                ),
                10.width,
                Text(
                  "$quantity",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                10.width,
                FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: AppColor.primaryHighContrast,
                    onPressed: () {
                      quantity = (quantity--);
                      var data =quantity < 1? 1: quantity;
                      print(data);
                      setState(() {
                        quantity = data;
                      });
                    },
                    child: const Text(
                      "--",
                      style: TextStyle(color: AppColor.white),
                    )), //
              ],
            ),
          if (widget.type == AppProductType.size)
            Row(
              children: [
                const Text(
                  "S",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                25.width,
                CustomImageWidget(
                  imagePath: "assets/svgs/arrow_down.svg",
                  onTap: () {
                    showModalBottomSheet(
                        context: context, builder: (_) => Column());
                  },
                )
              ],
            ),
          if (widget.type == AppProductType.color) SizedBox()
        ],
      ),
    );
  }
}
