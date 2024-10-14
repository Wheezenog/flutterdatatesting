// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:io' show Platform;

class Constants {
  static const CSV_FILEPATH = "assets/Data.csv";
  static String ENDLINE = Platform.isWindows ? '\r\n' : '\n';
}