import 'package:coin_commerce/core/domain/entities/category.dart';
import 'package:either_dart/src/either.dart';
import 'package:logger/logger.dart';

import '../../../../core/data/model/api_exception.dart';
import '../../../../core/domain/entities/failure_result.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../datasource/remote/product_api.dart';

class ProductRepositoryImpl extends ProductRepository{
  ProductRepositoryImpl({
    required ProductApi authApi,
    Logger? logger,
  })  : _api = authApi,
        _logger = logger;
  final ProductApi _api;
  final Logger? _logger;

  @override
  Future<Either<FailureResult, List<CategoryEntity>>> getCategory()async {
    try {
      final response = await _api.getCategory();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(
        FailureResult(
          title:  ex.message.toString(),
          message: ex.message.toString(),
        ),
      );
    } catch (ex,st) {
      _logger?.e(ex);
      print(st);
      return Left(
        FailureResult(
          title: 'Something went wrong',
          message: ex.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResult, List<ProductEntity>>>
  getProducts(String id) async{
    try {
      final response = await _api.getProducts(id);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(
        FailureResult(
          title:  ex.message.toString(),
          message: ex.message.toString(),
        ),
      );
    } catch (ex,st) {
      _logger?.e(ex);
      return Left(
        FailureResult(
          title: 'Something went wrong',
          message: ex.toString(),
        ),
      );
    }
  }

}