import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hello_world/basic_widgets/image_widget.dart';
import 'package:hello_world/basic_widgets/text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Contoh Data Picker",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variabel / State untuk mengambil tanggal
  DateTime selectedData = DateTime.now();

  // Initial SelectDate Flutter
  Future<void> _selectedData(BuildContext context) async {
    // Initial DateTime Final Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedData,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedData) {
      setState(() {
        selectedData = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh Data Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("${selectedData.toLocal()}".split('')[0]),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => {
                      _selectedData(context),
                      // ignore: avoid_print
                      print(selectedData.day +
                          selectedData.month +
                          selectedData.year)
                    },
                child: const Text("Pilih Tanggal"))
          ],
        ),
      ),
    );
  }
}

// class MyLayout extends StatelessWidget {
//   const MyLayout({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: ElevatedButton(
//           onPressed: () {
//             showAlertDialog(context);
//           },
//           child: const Text("Show Alert")),
//     );
//   }
// }

// showAlertDialog(BuildContext context) {
//   // set up the button
//   Widget okButton = TextButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       child: const Text("OK"));

//   // Set up ALert Dialog

//   AlertDialog alert = AlertDialog(
//     title: const Text("My Title"),
//     content: const Text("This is my message"),
//     actions: [okButton],
//   );

//   // show the dialog
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       });
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text("You have pushed the button this many times"),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           height: 50,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment Counter',
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
