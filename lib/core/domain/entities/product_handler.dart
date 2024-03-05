import 'package:flutter/cupertino.dart';

import '../../../features/product/domain/entity/product_entity.dart';

class ProductsHandler with ChangeNotifier{

  static final ProductsHandler _instance = ProductsHandler._internal();

  ProductsHandler._internal();

  factory ProductsHandler() {
    return _instance;
  }

  List<ProductEntity> products = [];

  updateProduct (List<ProductEntity> newProduct){
    if(newProduct.isNotEmpty ) {
      products = newProduct;
      notifyListeners();
    }
  }

}