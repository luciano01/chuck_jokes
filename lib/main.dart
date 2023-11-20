import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/bindings/app_binding.dart';
import 'app_widget.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppBinding(),
      child: const AppWidget(),
    ),
  );
}
