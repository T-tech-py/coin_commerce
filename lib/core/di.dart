

import 'package:coin_commerce/core/utils/session_manager.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di.dart';
import 'data/datasourse/local/local_caching.dart';
import 'data/datasourse/local/run_api.dart';
import 'domain/entities/session_user.dart';

Future<void> initializeCommonDependencies() async {
  final sharePreferences = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton(() => sharePreferences)
    ..registerLazySingleton(
          () => StorageUtil(
      ),
    )
    ..registerLazySingleton(Logger.new)
    ..registerLazySingleton(() => SessionUser)
   ..registerLazySingleton(
          () => NetworkHandler(
        sessionManager: sl<SessionManager>(),
      ),
    );
}