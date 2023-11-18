import 'dart:io';

String fixture(String json) => File('test/utils/$json').readAsStringSync();
