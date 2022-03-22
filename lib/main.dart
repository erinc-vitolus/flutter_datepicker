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
        title: Text(widget.title),
      ),
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(
                : TextStyle(
              fontSize: 40,
            )),
          ),
          child: Column(
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
      ),
    );
  }
}
