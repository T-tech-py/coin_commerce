import 'package:coin_commerce/features/product/domain/repository/product_repository.dart';
import 'package:coin_commerce/features/product/domain/usecase/get_categories_use_case.dart';
import 'package:coin_commerce/features/product/domain/usecase/get_product_use_case.dart';
import 'package:coin_commerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../core/data/datasourse/local/local_caching.dart';
import '../../core/data/datasourse/local/run_api.dart';
import '../../core/utils/session_manager.dart';
import 'data/datasource/remote/product_api.dart';
import 'data/datasource/remote/product_api_impl.dart';
import 'data/repository_impl/product_repository_impl.dart';

GetIt sl = GetIt.instance;


Future<void> productDependencies() async {

  sl..registerLazySingleton<ProductBloc>(() =>
      ProductBloc( sl<GetCategoryUseCase>(),sl<GetProductUseCase>(),
      )
  )..registerLazySingleton<GetCategoryUseCase>(() =>
      GetCategoryUseCase(feedRepository: sl<ProductRepository>())
  )..registerLazySingleton<GetProductUseCase>(() =>
      GetProductUseCase(feedRepository: sl<ProductRepository>())
  )..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    authApi:  sl<ProductApi>(),
  ))..registerLazySingleton<ProductApi>(() =>
      ProductApiImpl(
        logger: sl<Logger>(),
        restClient: sl<NetworkHandler>(),
      ));


}