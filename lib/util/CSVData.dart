import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CSVData {
static const path = "assets/Data.csv";
   
   Future<List<List<dynamic>>> loadCSVData() async {
    final rawData = await rootBundle.loadString(path);

    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);

    return listData;
  }

  static void writeCSVData(List<List<dynamic>> list, String path){
    final File file = File(path);

    file.writeAsString(list.toString());
  }
}
