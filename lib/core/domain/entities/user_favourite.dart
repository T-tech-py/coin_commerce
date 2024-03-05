//
// import 'package:flutter/cupertino.dart';
// import 'package:lasaa/common/core/constant.dart';
// import 'package:location/location.dart';
//
// import 'location_entity.dart';
//
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:flutter/cupertino.dart';

class UserFavourite with ChangeNotifier {
  static final UserFavourite _instance = UserFavourite._internal();

  UserFavourite._internal();

  factory UserFavourite() {
    return _instance;
  }
  List<ProductEntity> favourites = [];
  bool isLiked =false;

  addProduct(ProductEntity newFavourite){
   favourites.add(newFavourite);
    notifyListeners();
  }

  removeProduct(ProductEntity newFavourite){
   favourites.remove(newFavourite);
    notifyListeners();
  }
  bool checkAndAddProduct(ProductEntity newFavourite){
   if(favourites.contains(newFavourite)){
     favourites.remove(newFavourite);
     isLiked = false;
     notifyListeners();

     return false;
    }else{
     favourites.add(newFavourite);
     isLiked= true;
     notifyListeners();
     return true;
   }

  }

}