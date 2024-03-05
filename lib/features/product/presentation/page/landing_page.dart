import 'package:coin_commerce/core/utils/colors.dart';
import 'package:coin_commerce/core/utils/images.dart';
import 'package:coin_commerce/features/product/presentation/page/cart_page.dart';
import 'package:coin_commerce/features/product/presentation/page/favourite_page.dart';
import 'package:coin_commerce/features/product/presentation/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/domain/entities/routing.dart';
import '../../../../core/shared/custom_image_widget.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  static const routeName = '/baseView';

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: Consumer<Routing>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
              currentIndex: Routing().currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColor.white,
              selectedItemColor: AppColor.primaryHighContrast,
              unselectedItemColor: AppColor.black,
              // fixedColor: AppColor.white,
              onTap: (val) {
                Routing().setRoute(val);
                setState(() {
                  currentIndex = val;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: CustomImageWidget(
                    imagePath: AppVectors.dashboard,
                    color: AppColor.black,
                    width: 40, height: 40,
                  ),
                  activeIcon: CustomImageWidget(
                    imagePath: AppVectors.dashboard,
                    color: AppColor.primaryHighContrast,
                    width: 40, height: 40,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CustomImageWidget(
                    imagePath: AppVectors.heart,
                    color: AppColor.black,
                    width: 40, height: 40,
                  ),
                  activeIcon: CustomImageWidget(
                    imagePath: AppVectors.heart,
                    color: AppColor.primaryHighContrast,
                    width: 40, height: 40,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CustomImageWidget(
                    imagePath: AppVectors.product,
                    color: AppColor.black,
                    width: 40, height: 40,
                  ),
                  activeIcon: CustomImageWidget(
                    imagePath: AppVectors.product,
                    color: AppColor.primaryHighContrast,
                    width: 40, height: 40,
                  ),
                  label: '',
                ),

              ]);
        },
      ),
      body: Consumer<Routing>(
        builder: (context, provider, child) {
          return body(Routing().currentIndex);
        },
      ),
    );
  }

  Widget body(int currentPage) {
    switch (currentPage) {
      case 0:
        return const HomePage();
      case 1:
        return const FavoritePage();
      case 2:
        return const CartPage();
      default:
        return const Center(child: Text("Page not found"));
    }
  }

}