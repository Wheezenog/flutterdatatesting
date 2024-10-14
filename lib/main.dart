import 'package:flutter/material.dart';
import 'package:flutterdatatesting/util/csv_data.dart';
import 'package:logger/logger.dart';

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
  var inputID = 0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    CSVData.init();
  }

  void getData() async {
    data = await CSVData().loadCSVData();
    var log = Logger();
    log.t(data[0][1]);
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

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
                    setState(() {
                      inputID++;
                      String inputText = controller.text;
                      CSVData.writeCSVData('$inputText, $inputID');
                    });
                    controller.clear();
                  },
                  tooltip: 'Submit Text!',
                  child: const Icon(Icons.text_fields),
                ),
                const SizedBox(width: 25),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      getData();
                    });
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
