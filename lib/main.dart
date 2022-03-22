import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Datepicker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const DatepickerPage(title: 'Flutter Datepicker'),
    );
  }
}

class DatepickerPage extends StatefulWidget {
  const DatepickerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DatepickerPage> createState() => _DatepickerPageState();
}

class _DatepickerPageState extends State<DatepickerPage> {
  DateTime _date = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the DatepickerPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Choose a date:'),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 28),
                padding: const EdgeInsets.all(8),
              ),
              onPressed: () {
                _selectDate(context);
              },
              child: Text(DateFormat.yMMMEd().format(_date)),
            ),
            const SizedBox(height: 40),
            const Text(
              'It has been',
            ),
            const SizedBox(height: 8),
            Text(
              '${DateTime.now().difference(_date).inDays} days',
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'since this date.',
            ),
          ],
        ),
      ),
    );
  }
}
