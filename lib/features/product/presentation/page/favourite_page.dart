import 'package:coin_commerce/core/shared/app_back_button.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/presentation/page/product_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_navigator.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  static const routeName = '/favoritePage';
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            const Padding(
              padding:  EdgeInsets.all(26),
              child:  Row(
                children: [
                  AppBackButton(),
                  Spacer(),
                  Text("My Favourites (12)",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                  Spacer(),
                ],
              ),
            ),
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
                              imagePath: "assets/svgs/love.svg",))
                      ],
                    );
                  }),
            ),
          ],
        ) ,
      ),
    );
  }
}
