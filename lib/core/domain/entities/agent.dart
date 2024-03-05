import 'package:coin_commerce/core/domain/entities/category.dart';
import 'package:flutter/cupertino.dart';


class CategoryHandler with ChangeNotifier{

  static final CategoryHandler _instance = CategoryHandler._internal();

  CategoryHandler._internal();

  factory CategoryHandler() {
    return _instance;
  }

  List<CategoryEntity> category = [];

  updateCategory (List<CategoryEntity> newCategory){
    if(newCategory.isNotEmpty){
      category = newCategory;
      notifyListeners();
    }

  }

}