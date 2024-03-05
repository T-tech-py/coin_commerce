
import 'package:coin_commerce/core/data/datasourse/local/run_api.dart';
import 'package:coin_commerce/core/domain/entities/category.dart';
import 'package:coin_commerce/core/ui/app_enums.dart';
import 'package:coin_commerce/features/product/data/datasource/remote/product_api.dart';
import 'package:coin_commerce/features/product/domain/entity/product_entity.dart';
import 'package:logger/logger.dart';

import '../../../../../core/data/model/api_exception.dart';

class ProductApiImpl extends ProductApi {
  final NetworkHandler _client;
  final Logger? _logger;

  ProductApiImpl({
    Logger? logger,
    required NetworkHandler restClient,

  })  :
        _client = restClient,
        _logger = logger;

  @override
  Future<List<CategoryEntity>> getCategory( ) async {
    final response = await _client.runApi(
      url: 'https://fakestoreapi.com/products/categories',
      type: ApiRequestType.get,
    );
    try {
     var data = (response as List).map((e) => CategoryEntity.fromJson(e)).toList();
      print(data);
      return  data;

    } catch (ex,st) {
      //_logger?.e(ex);
      print(st);
      throw ApiException(message: ex.toString());
    }
  }

  @override
  Future<List<ProductEntity>> getProducts(String data)async {
    final response = await _client.runApi(
        url: 'https://fakestoreapi.com/products/category/$data',
        type: ApiRequestType.get,
        useToken: false
    );
    try {
      return (response as List).map((e) => ProductEntity.fromJson(e)).toList();;
    } catch (ex,st) {
      _logger?.e(ex);
      print(ex);
      throw ApiException(
          message: ex.toString()
      );
    }
  }



}