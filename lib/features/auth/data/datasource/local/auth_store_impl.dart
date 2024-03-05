


import '../../../../../core/data/datasourse/local/local_caching.dart';
import '../../../../../core/domain/entities/session_user.dart';
import 'auth_store.dart';

class AuthStoreImpl implements AuthStore {
  static const String KEY_USER = 'KEY_USER';
  static const String KEY_AUTH_TOKEN = 'KEY_AUTH_TOKEN';

  final StorageUtil _sharedPreference;

  AuthStoreImpl({
    required StorageUtil sharedPreference,
  }) : _sharedPreference = sharedPreference;

  @override
  Future<String?> retrieveAuthToken() {
    // TODO: implement retrieveAuthToken
    throw UnimplementedError();
  }

  @override
  Future<SessionUser?> retrieveCurrentUser() {
    // TODO: implement retrieveCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAuthToken(String authToken) {
    // TODO: implement saveAuthToken
    throw UnimplementedError();
  }

  @override
  Future<bool> saveCurrentUser(SessionUser user) {
    // TODO: implement saveCurrentUser
    throw UnimplementedError();
  }

  // @override
  // Future<SessionUser?> retrieveCurrentUser() async {
  //   // final json = await _sharedPreference    //(KEY_USER) as Map<String, dynamic>;
  //   return SessionUser.fromJson(json);
  // }

  // @override
  // Future<bool> saveCurrentUser(SessionUser user) {
  //   return _sharedPreference.save(KEY_USER, user.toJson());
  // }
  //
  // @override
  // Future<bool> saveAuthToken(String authToken) {
  //   return _sharedPreference.save(KEY_AUTH_TOKEN, authToken);
  // }
  //
  // @override
  // Future<String?> retrieveAuthToken() async {
  //   final token = await _sharedPreference.retrieve(KEY_AUTH_TOKEN) as String;
  //   return token;
  // }
}
