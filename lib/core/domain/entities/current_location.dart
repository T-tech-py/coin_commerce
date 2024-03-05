//
// import 'package:flutter/cupertino.dart';
// import 'package:lasaa/common/core/constant.dart';
// import 'package:location/location.dart';
//
// import 'location_entity.dart';
//
import 'package:flutter/cupertino.dart';

class UserFavourite with ChangeNotifier {
  static final UserFavourite _instance = UserFavourite._internal();

  UserFavourite._internal();

  factory UserFavourite() {
    return _instance;
  }
  //List<FavouriteModel> favourites = [];

  // setLocation(List<LocationEntity> newFavourite){
  //  // favourites = newLocation;
  //   notifyListeners();
  // }


}