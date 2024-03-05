
import 'package:get_it/get_it.dart';

import 'core/di.dart';
import 'features/auth/di.dart';
import 'features/product/di.dart';

GetIt sl = GetIt.instance;


Future<void> initializeAppDependencies() async {
  await initializeCommonDependencies();
   await authDependencies();
  await productDependencies();
}