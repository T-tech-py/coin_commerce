import 'package:coin_commerce/core/domain/entities/cart_hander.dart';
import 'package:coin_commerce/core/shared/app_back_button.dart';
import 'package:coin_commerce/core/shared/app_button.dart';
import 'package:coin_commerce/core/shared/app_textfield.dart';
import 'package:coin_commerce/core/utils/app_navigator.dart';
import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/presentation/page/order_placed_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/shared/custom_image_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static const routeName = '/cartPage';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(26),
              child: Row(
                children: [
                  AppBackButton(),
                  Spacer(),
                  Text(
                    "Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                padding: const EdgeInsets.all(26),
                children: [
                  // 24.height,
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        CartHandler().clear();

                      },
                      child: const Text(
                        "Remove All",
                        style: TextStyle(color: AppColor.black),
                      ),
                    ),
                  ),
                  16.height,
                  Consumer<CartHandler>(
                    builder: (context, provider, child) {
                      return Column(
                        children: List.generate(provider.product.length,
                                (index) =>  Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColor.bg,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        CustomImageWidget(
                                          imagePath:
                                          provider.product[index].image?? "",
                                          width: 64,
                                          height: 64,
                                        ),
                                        12.width,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text(
                                               (provider.product[index].title?? "N/A").replaceRange(20,
                                                   provider.product[index].title!.length, '...'),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            8.height,
                                            const Text(
                                              "Size: M   Quantity: 1",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  //color: AppColor.primaryHighContrast,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                             Text(
                                              "\$${provider.product[index].price?? ""}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: AppColor.primaryHighContrast,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            8.height,
                                            // Row(
                                            //   children: [
                                            //     InkWell(
                                            //       onTap: () {},
                                            //       child: const CircleAvatar(
                                            //         backgroundColor:
                                            //         AppColor.primaryHighContrast,
                                            //         radius: 14,
                                            //         child: Icon(
                                            //           Icons.add,
                                            //           size: 10,
                                            //           color: AppColor.white,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //     10.width,
                                            //     InkWell(
                                            //       onTap: () {},
                                            //       child: const CircleAvatar(
                                            //           radius: 14,
                                            //           backgroundColor:
                                            //           AppColor.primaryHighContrast,
                                            //           child: Text(
                                            //             "--",
                                            //             style: TextStyle(
                                            //                 color: AppColor.white,
                                            //                 fontSize: 8),
                                            //           )),
                                            //     ), //
                                            //   ],
                                            // ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      );
                    },
                  ),
                  24.height,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26),
              child: Column(
                children: [
                  const PriceCard(
                    header: 'Subtotal',
                    subTitle: '\$200',
                  ),
                  12.width,
                  const PriceCard(
                    header: 'Shipping Cost',
                    subTitle: '\$8.00',
                  ),
                  12.width,
                  const PriceCard(
                    header: 'Tax',
                    subTitle: '\$0.00',
                  ),
                  12.width,
                  const PriceCard(
                    header: 'Total',
                    isBold: true,
                    subTitle: '\$208',
                  ),
                  31.height,
                  AppTextField(
                    fillColor: AppColor.bg,
                    prefixIcon: const CustomImageWidget(
                      imagePath: "assets/svgs/verify.svg",
                      width: 24,
                      height: 24,
                    ),
                    suffixIcon: const CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColor.primaryHighContrast,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.white,
                        size: 16,
                      ),
                    ),
                    hintText: '    Enter Coupon Code',
                    hitTextCollor: AppColor.black.withOpacity(0.5),
                  ),
                  40.height,
                  AppButton(
                      text: 'Checkout',
                      onTap: () {
                        pushToNextScreen(
                            child: const OrderPlacedPage(),
                            name: OrderPlacedPage.routeName);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  const PriceCard(
      {super.key,
      required this.header,
      this.color,
      this.fontSize,
      required this.subTitle,
      this.isBold = false});
  final String header;
  final String subTitle;
  final bool? isBold;
  final Color? color;
  final double? fontSize;
  //final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          header,
          style: context.appTheme.textTheme.bodyMedium!.copyWith(
              color: color ?? AppColor.black.withOpacity(0.5),
              fontSize: fontSize ?? 14),
        ),
        const Spacer(),
        Text(
          subTitle,
          style: TextStyle(
              color: AppColor.blackE1,
              fontSize: 16,
              fontWeight: isBold! ? FontWeight.w600 : FontWeight.w400),
        ),
        8.width,
      ],
    );
  }
}
