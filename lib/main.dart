import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/domain/entities/routing.dart';
import 'core/singletons/app_singleton.dart';
import 'di.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/page/root.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeAppDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Routing(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(sl(),sl(),),
          ),
        ],
        child: MaterialApp(
          title: '',
          navigatorKey: SingletonService().key,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthenticationScreen(),
        ),
      ),
    );
  }
}


