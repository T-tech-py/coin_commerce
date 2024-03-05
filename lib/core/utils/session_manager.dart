import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../../features/auth/data/datasource/local/auth_store_impl.dart';
import '../../features/auth/presentation/page/login_screen.dart';
import '../data/datasourse/local/local_caching.dart';
import '../domain/entities/session_user.dart';

class SessionManager extends ChangeNotifier {
  final String _initialRoute = LoginScreen.routeName;

  String get initialRoute => _initialRoute;

  String? _deeplinkDestination;

  String? get deeplink => _deeplinkDestination;
  String? _deeplinkData;

  String? get deeplinkData => _deeplinkData;

  SessionUser? currentUser;

  String? authToken;

  final StorageUtil _storageUtil;
  final Logger? _logger;

  SessionManager({
    required StorageUtil storageUtil,
    Logger? logger,
  })  :
        _storageUtil = storageUtil,
        _logger = logger;

  Future<void> init() async {
    try {
      final userJson = await _storageUtil
          .getData(AuthStoreImpl.KEY_USER) as Map<String, dynamic>;
      currentUser = SessionUser.fromJson(userJson);
      print(currentUser);
      _initialRoute;
    } catch (ex) {
      _logger?.i('No current user was found');
    }

    try {
      authToken = await _storageUtil
          .getData(AuthStoreImpl.KEY_USER) as String;
    } catch (ex) {
      _logger?.i('No current user was found');
    }


  }

  void updateCurrentUser(SessionUser? user) {
    currentUser = user;
    if (user == null) {
      _storageUtil.remove(AuthStoreImpl.KEY_USER);
    } else {
      _storageUtil.remove(AuthStoreImpl.KEY_USER);
      _storageUtil.setData(AuthStoreImpl.KEY_USER, user);
    }
    notifyListeners();
  }

  void updateDeeplink({
    required String? destinationRoute,
    required String? link,
  }) {
    _deeplinkDestination = destinationRoute;
    _deeplinkData = link;
    notifyListeners();
  }

  void updateAuthToken(String? token) {
    if (token != null) {
      authToken = token;
      notifyListeners();
    } else {
      _logger?.i('TOKEN IS NULL, UPDATE IGNORED');
      _logger?.i(StackTrace.current);
    }
  }

}