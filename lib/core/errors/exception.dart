
class ExceptionService implements Exception {}

// SERVER
class ExceptionServiceCallBack implements Exception {
  final String massage;

  ExceptionServiceCallBack({required this.massage});
}
// CONNECTION NETWORK
class ExceptionOffline implements Exception {}
