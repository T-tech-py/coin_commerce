abstract class ConnectionChecker {
  Future<bool> hasInternetConnection();

  Future<bool> ensureHasInternetConnection();
}
