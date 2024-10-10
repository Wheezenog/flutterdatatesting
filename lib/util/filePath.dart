import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

class Filepath {
  final log = Logger('FilePath');
  late final Directory directory;
  late final String path;
  late final File file;

  Future<String> get _localPath async {
    return directory.path;
  }

  Future<File> get _localFile async {
    log.info('$path/Data.txt');
    return File('$path/Data.txt');
  }

  Future<File> writeData(String text) async {
    // Write the file
    return file.writeAsString(text);
  }

  Future<String> readData() async {
    try {
      String text = await file.readAsString();
      return text;
    
    } catch (e) {
      // If encountering an error, return 0
      log.severe('Error Reading Data : $e');
      return '';
    }
  }

  Future<void> init() async {
    directory = await getApplicationCacheDirectory();
    path = await _localPath;
    file = await _localFile;
  }
}
