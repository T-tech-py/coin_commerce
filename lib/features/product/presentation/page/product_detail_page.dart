import 'package:coin_commerce/core/domain/entities/cart_hander.dart';
import 'package:coin_commerce/core/domain/entities/user_favourite.dart';
import 'package:coin_commerce/core/shared/app_back_button.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/ui/app_enums.dart';
import 'package:coin_commerce/core/utils/app_navigator.dart';
import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:coin_commerce/features/product/presentation/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_toast.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productEntity});
  static const routeName = '/productDetailPage';
  final ProductEntity productEntity;
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
            Consumer<UserFavourite>(
              builder: (context,model,_) {
                return  Row(
                  children: [
                    const AppBackButton(),
                    const Spacer(),
                    CustomImageWidget(
                        onTap: (){
                          model.checkAndAddProduct(widget.productEntity);
                          if( UserFavourite().isLiked){
                            AppToast.showSuccessToast(context: context,
                                text: "Added to Favourite");
                            return;
                          }
                          AppToast.showWarningToast(context: context,
                              text: "Removed from Favourite");
                        },
                        imagePath:model.isLiked?
                    "assets/svgs/love.svg":"assets/svgs/heart_fill.svg"),
                  ],
                );
              }
            ),
            24.height,
             CustomImageWidget(
              imagePath:widget.productEntity.image??'',
                width: double.infinity,
              height: 245,
            ),
            24.height,
             Text(
              widget.productEntity.title??"N/A",
              style:const TextStyle(
                fontSize: 18,
              ),
            ),
            8.height,
             Text(
              "\$${widget.productEntity.price}",
              style:const TextStyle(
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
             widget.productEntity.description??"",
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
             Text(
              "${widget.productEntity.rating?.rate} Ratings",
              style: const TextStyle(
                fontSize: 18,
                color: AppColor.black ,
                  fontWeight: FontWeight.w500
              ),
            ),
            30.height,
            AddToCartButton(price: '${widget.productEntity.price}', onTap: () {
              CartHandler().addProduct(widget.productEntity);
              pushToNextScreen(
                  child: const CartPage(),
                  name: CartPage.routeName);
            },),
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
  final sizes = ['S','M','L','XL','XXL','2XL'];
  ValueNotifier<String> productSize = ValueNotifier('S');
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
                 Text(
                  productSize.value,
                  style:const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                25.width,
                CustomImageWidget(
                  imagePath: "assets/svgs/arrow_down.svg",
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColor.transparent,
                        isScrollControlled: true,
                        isDismissible: false,
                        context: context, builder: (_) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 14),
                        decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )
                        ),
                        child: SizedBox(
                          height: 400,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  const Text(
                                    "Size",
                                    style: TextStyle(
                                        fontSize: 24, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  IconButton(onPressed: (){
                                    setState(() {

                                    });
                                    pop();},
                                      icon: const Icon(Icons.close))
                                ],
                              ),
                              27.height,
                              ValueListenableBuilder(
                                  valueListenable: productSize,
                                  builder: (context,value,_){
                                return Expanded(
                                  child: ListView.separated(
                                      itemBuilder: (context,index){
                                        return  SizeCard(size: sizes[index],
                                          selected: sizes[index] == value,
                                          onTap: () {
                                          productSize.value = sizes[index];
                                          },);
                                      },
                                      separatorBuilder: (context,index)=>15.height,
                                      itemCount: sizes.length),
                                );
                                  })
                            ],
                          ),
                        )));
                  },
                )
              ],
            ),
          if (widget.type == AppProductType.color) const SizedBox()
        ],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.price, required this.onTap});
  final String price;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColor.primaryHighContrast,
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text( "\$$price",
              style: const TextStyle(
                fontSize: 16,fontWeight: FontWeight.w600,
                color: AppColor.white,

              ),),
            const Text( "Add to Cart",
                style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w500,
                  color: AppColor.white,
                )),

          ],
        ),
      ),
    );
  }
}

class SizeCard extends StatelessWidget {
  const SizeCard({super.key, required this.size, required this.selected, required this.onTap});
  final String size;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: selected?AppColor.primaryHighContrast:AppColor.bg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              size,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500,
              color: selected?AppColor.white:AppColor.black),
            ),
            if(selected)
            const Icon(Icons.check,color: AppColor.white,),
          ],
        ),
      ),
    );
  }
}

