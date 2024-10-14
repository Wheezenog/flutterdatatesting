import 'dart:io';
import 'package:flutterdatatesting/util/constants.dart';

class CSVData {
  late final File file;
  late final String endline;
  
  void init() async {
    file = File(Constants.CSV_FILEPATH);
    endline = Constants.ENDLINE;
    file = await file.writeAsString('Text, ID $endline');
  }

  Future<List<List<dynamic>>> loadCSVData() async {
    final File file = File(Constants.CSV_FILEPATH);
    // List<String> rawData = List.empty();
    List<List<String>> listData = List.empty(growable: true);
    var rawData = await file.readAsLines();
    listData.add(rawData);
    return listData;
  }

  static void writeCSVData(String input) {
    final File file = File(Constants.CSV_FILEPATH);
    String endline = Constants.ENDLINE;
    FileMode mode = FileMode.append;
    file.writeAsString("$input $endline", mode: mode);
  }
}
