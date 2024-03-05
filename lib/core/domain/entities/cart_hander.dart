//
// import 'package:flutter/cupertino.dart';
// import 'package:lasaa/common/core/constant.dart';
// import 'package:location/location.dart';
//
// import 'location_entity.dart';
//
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:flutter/cupertino.dart';

class CartHandler with ChangeNotifier {
  static final CartHandler _instance = CartHandler._internal();

  CartHandler._internal();

  factory CartHandler() {
    return _instance;
  }
  List<ProductEntity> product = [];

  addProduct(ProductEntity newFavourite){
    product.add(newFavourite);
    notifyListeners();
  }

  removeProduct(ProductEntity newFavourite){
    product.remove(newFavourite);
    notifyListeners();
  }

  clear(){
    product.clear();
    notifyListeners();
  }

}