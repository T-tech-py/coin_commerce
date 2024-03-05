import 'package:coin_commerce/core/domain/entities/agent.dart';
import 'package:coin_commerce/core/domain/entities/product_handler.dart';
import 'package:coin_commerce/core/domain/entities/routing.dart';
import 'package:coin_commerce/core/domain/entities/user_favourite.dart';
import 'package:coin_commerce/core/shared/app_loader.dart';
import 'package:coin_commerce/core/shared/custom_image_widget.dart';
import 'package:coin_commerce/core/utils/app_navigator.dart';
import 'package:coin_commerce/core/utils/app_toast.dart';
import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/extensions.dart';
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:coin_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:coin_commerce/features/product/presentation/page/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/entities/category.dart';
import '../../../../di.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryEntity> category = [];
  List<ProductEntity> products = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(sl(), sl())..add(GetCategoryEvent()),
      child: Scaffold(
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductSuccessState) {
              setState(() {
                products = state.products ?? products;
                category = state.categories ?? category;
                CategoryHandler().updateCategory(category);
                ProductsHandler().updateProduct(products);
                loading =false;
              });

            }
          },
          builder: (context, state) {
            return AppLoader(
              isLoading:loading? loading: state is ProductLoadingState && ProductsHandler().products.isEmpty,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.height,
                      const Row(
                        children: [
                          Icon(
                            Icons.currency_bitcoin,
                            color: Colors.orange,
                          ),
                          Spacer(),
                          CustomImageWidget(imagePath: 'assets/svgs/cart.svg'),
                        ],
                      ),
                      20.height,
                      Consumer<CategoryHandler>(
                        builder: (context, provider, child) {
                          return SizedBox(
                            height: 30,
                            child: ListView.separated(
                              shrinkWrap: true,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.category.length,
                              itemBuilder: (context, index) => Container(
                                height: 30,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.grey300.withOpacity(0.7),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    context.read<ProductBloc>().add(
                                        GetProductEvent(
                                            name: provider.category[index].name));
                                    setState(() {
                                      loading = true;
                                    });
                                  },
                                  child: Text(
                                    provider.category[index].name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColor.appDark,
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) => 9.width,
                            ),
                          );
                        },
                      ),
                      60.height,
                      Row(
                        children: [
                          const Text(
                            "Products",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Routing().setRoute(1);
                            },
                            child: const Text("See all",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.grey300,
                                )),
                          ),
                        ],
                      ),
                      30.height,
                      Expanded(
                        child: Consumer<ProductsHandler>(
                          builder: (context, provider, child) {
                            return GridView.builder(
                                //  physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisExtent: 300,
                                        mainAxisSpacing: 10),
                                itemCount: provider.products.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          pushToNextScreen(
                                              child:  ProductDetailPage(
                                                productEntity: provider.products[index],),
                                              name: ProductDetailPage.routeName);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageWidget(
                                              imagePath:
                                              provider.products[index].image ?? '',
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                            10.height,
                                            Text(
                                              provider.products[index].title ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            //8.height,
                                            Text(
                                              "\$${provider.products[index].price}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                       Positioned(
                                          right: 8,
                                          top: 8,
                                          child: CustomImageWidget(
                                            onTap: (){
                                             if( UserFavourite().checkAndAddProduct(provider.products[index])){
                                               AppToast.showSuccessToast(context: context,
                                                   text: "Added to Favourite");
                                               return;
                                             }
                                             AppToast.showWarningToast(context: context,
                                                 text: "Removed from Favourite");
                                            },
                                            imagePath: "assets/svgs/heart.svg",
                                          ))
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
