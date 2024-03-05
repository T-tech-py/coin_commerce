import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/utils/app_navigator.dart';
import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/presentation/page/product_detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
static const routeName = '/homePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height,
                const Row(
                  children: [
                    Icon(Icons.currency_bitcoin,color: Colors.orange,),
                    Spacer(),
                    CustomImageWidget(imagePath: 'assets/svgs/cart.svg'),
                  ],
                ),
                20.height,
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (context,index)=>Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8,
                          vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.grey300.withOpacity(0.7),
                      ),
                      child: const Text(
                        "Shoes",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.appDark,
                        ),
                      ),
                    ),
                    separatorBuilder: (context,index)=>9.width,

                  ),
                ),
                60.height,
                const Row(
                  children: [
                    Text("Products",
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                    Spacer(),
                    Text("See all",
                       style: TextStyle(
                          fontSize: 16,
                         color: AppColor.grey300,
                        )),
                  ],
                ),
                30.height,
                Expanded(
                  child: GridView.builder(
                  //  physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 10),
                      itemBuilder: (context,index){
                      return Stack(
                        children: [
                          InkWell(
                            onTap:(){
                              pushToNextScreen(
                                  child: const ProductDetailPage(),
                                  name: ProductDetailPage.routeName);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomImageWidget(
                                  imagePath:"https://www.realsimple.com/thmb/vDQYdFGqp9s_Gvr4wyCdFh0O8Ag=/4000x2667/filters:no_upscale()/how-to-clean-microfiber-cloth-GettyImages-1314720631-dfb583e54f9e40dea2fea26b6dfaf26f.jpg",
                                  height: 200,
                                width: double.infinity,
                                fit: BoxFit.fill,),
                                10.height,
                                const Text("Products",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),),
                                //8.height,
                                const Text("\$500",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),),
                              ],
                            ),
                          ),
                          const Positioned(
                            right: 8,
                            top: 8,
                              child: CustomImageWidget(
                                imagePath: "assets/svgs/heart.svg",))
                        ],
                      );
                      }),
                )
              ],
            ),
          ),
      ),
    );
  }
}
