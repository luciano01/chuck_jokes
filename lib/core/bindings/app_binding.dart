import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core.dart';

class AppBinding extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<Client>(
      () => http.Client(),
    );

    i.addSingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );

    i.addSingleton<NetworkCheck>(
      () => NetworkCheckImpl(
        i.get<InternetConnectionChecker>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.module("/", module: HomeBinding());
  }
}
