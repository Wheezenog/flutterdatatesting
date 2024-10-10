import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:csv/csv.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final controller = TextEditingController();
  List<List<dynamic>> data = [];

    void loacCSV() async {
      final rawData = await rootBundle.loadString("assets/Data.csv");
      List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
      setState(() {
        data = listData;
      });
    }

  String contents = '';
  String text = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = this.controller;
    final log = Logger('Main');

    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print('${record.level.name}: ${record.time}: ${record.message}');
    });

    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter some text',
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    log.info('Data entered: $controller.text');
                    controller.clear();
                  },
                  tooltip: 'Submit Text!',
                  child: const Icon(Icons.text_fields),
                ),
                const SizedBox(width: 25),
                FloatingActionButton(
                  onPressed: () {
                    loacCSV();
                    print(data);
                  },
                  tooltip: 'print data',
                  child: const Icon(Icons.feed_outlined),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }


}
