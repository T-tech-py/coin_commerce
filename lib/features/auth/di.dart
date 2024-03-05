
import 'package:coin_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../core/data/datasourse/local/local_caching.dart';
import '../../core/data/datasourse/local/run_api.dart';
import '../../core/utils/session_manager.dart';
import 'data/datasource/remote/auth_api.dart';
import 'data/datasource/remote/auth_api_impl.dart';
import 'data/datasource/local/auth_store.dart';
import 'data/datasource/local/auth_store_impl.dart';
import 'data/repository_impl/auth_repository_impl.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/usecase/login_use_case.dart';
import 'domain/usecase/signup_use_case.dart';

GetIt sl = GetIt.instance;


Future<void> authDependencies() async {

  sl..registerLazySingleton<AuthBloc>(() =>
      AuthBloc( sl<LoginUseCase>(),sl<SignupUseCase>(),
      )
  )..registerLazySingleton<LoginUseCase>(() =>
      LoginUseCase(feedRepository: sl<AuthRepository>())
  )..registerLazySingleton<SignupUseCase>(() =>
      SignupUseCase(feedRepository: sl<AuthRepository>())
  )
    ..registerLazySingleton<AuthStore>(() => AuthStoreImpl(
    sharedPreference: sl<StorageUtil>(),
  ))..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authApi:  sl<AuthApi>(),
  ))..registerLazySingleton<AuthApi>(() =>
      AuthApiImpl(
        logger: sl<Logger>(),
        restClient: sl<NetworkHandler>(),
      ));

  final sessionManager =
  SessionManager(storageUtil: sl<StorageUtil>());
  await sessionManager.init();
  sl
    .registerLazySingleton(() => sessionManager);

}