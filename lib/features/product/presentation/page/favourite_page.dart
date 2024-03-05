import 'package:coin_commerce/core/domain/entities/user_favourite.dart';
import 'package:coin_commerce/core/shared/app_back_button.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/ui/empty_state.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/presentation/page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  Text("My Favourites",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Consumer<UserFavourite>(
                builder: (context,model,_) {
                  return model.favourites.isEmpty?
                      const EmptyState(image: "assets/images/cart.png",
                          text: "You are yet to add an Item to your favorite list")
                      :GridView.builder(
                    //  physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 300,
                          mainAxisSpacing: 10),
                      itemCount: model.favourites.length,
                      itemBuilder: (context,index){
                        return Stack(
                          children: [
                            InkWell(
                              onTap:(){
                                pushToNextScreen(
                                    child:  ProductDetailPage(productEntity: model.favourites[index],),
                                    name: ProductDetailPage.routeName);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   CustomImageWidget(
                                    imagePath:model.favourites[index].image??"",
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.fill,),
                                  10.height,
                                   Text(model.favourites[index].title??"",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),),
                                  //8.height,
                                   Text("\$${model.favourites[index].price}",
                                    style:const TextStyle(
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
                      });
                }
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
