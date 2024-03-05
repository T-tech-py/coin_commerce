

import '../../../../core/domain/entities/session_user.dart';

abstract class AuthStore {
  Future<SessionUser?> retrieveCurrentUser();

  Future<bool> saveCurrentUser(SessionUser user);

  Future<String?> retrieveAuthToken();

  Future<bool> saveAuthToken(String authToken);
}
