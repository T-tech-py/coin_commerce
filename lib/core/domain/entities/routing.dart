import 'package:flutter/foundation.dart';

class Routing with ChangeNotifier {
  static final Routing _instance = Routing._internal();

  Routing._internal();

  factory Routing() {
    return _instance;
  }

  int currentIndex = 0;

  setRoute(int index){
    currentIndex = index;
    notifyListeners();
  }

}