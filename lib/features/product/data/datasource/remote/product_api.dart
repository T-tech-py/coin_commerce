
import 'package:coin_commerce/core/domain/entities/category.dart';
import '../../../domain/entity/product_entity.dart';

abstract class ProductApi {
  Future<List<CategoryEntity>> getCategory();
  Future<List<ProductEntity>> getProducts(String data);


}