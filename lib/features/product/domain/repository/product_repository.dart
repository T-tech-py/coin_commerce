import 'package:coin_commerce/core/domain/entities/category.dart';
import 'package:either_dart/either.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../entity/product_entity.dart';

abstract class ProductRepository{

  Future<Either<FailureResult, List<CategoryEntity>>> getCategory();
  Future<Either<FailureResult,  List<ProductEntity>>> getProducts(
      String id);
}