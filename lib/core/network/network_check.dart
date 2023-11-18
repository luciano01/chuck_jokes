import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkCheck {
  Future<bool> get hasConnection;
}

class NetworkCheckImpl implements NetworkCheck {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkCheckImpl(this._internetConnectionChecker);
  @override
  Future<bool> get hasConnection => _internetConnectionChecker.hasConnection;
}
