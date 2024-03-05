//
// import 'package:flutter/cupertino.dart';
// import 'package:lasaa/common/core/constant.dart';
// import 'package:location/location.dart';
//
// import 'location_entity.dart';
//
// class CurrentLocation with ChangeNotifier {
//   static final CurrentLocation _instance = CurrentLocation._internal();
//
//   CurrentLocation._internal();
//
//   factory CurrentLocation() {
//     return _instance;
//   }
//   Location location = Location();
//   late bool _serviceEnabled;
//   late PermissionStatus _permissionGranted;
//   LocationData? _locationData;
//   LocationEntity? locationData;
//
//   setLocation(LocationEntity newLocation){
//     locationData = newLocation;
//     notifyListeners();
//   }
//
//   getLocation()async{
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     _locationData = await location.getLocation();
//    final address = await myLocation(_locationData?.latitude??0,
//         _locationData?.longitude??0);
//
//    final country = await myCountry(_locationData?.latitude??0,
//         _locationData?.longitude??0);
//
//    final city = await myCity(_locationData?.latitude??0,
//         _locationData?.longitude??0);
//
//
//
//   final data = LocationEntity(address: address,
//       longitude: _locationData?.longitude??0,
//        latitude: _locationData?.latitude??0,
//       city: city,
//       country: country);
//
//     setLocation(data);
//
//   }
// }