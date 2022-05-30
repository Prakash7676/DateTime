import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime birthdate = DateTime(1999, 05, 14);

  TimeOfDay birthTime = TimeOfDay(hour: 07, minute: 00);
  String years = "", months = "", days = "", minutes = "", seconds = "";

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: birthdate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2025));

    if (_datePicker != null && _datePicker != birthdate) {
      setState(() {
        birthdate = _datePicker;
      });
    }
  }

  _selectTime(BuildContext context) async {
    TimeOfDay? _timePicker = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 07, minute: 00));

    if (_timePicker != null && _timePicker != birthdate) {
      setState(() {
        birthTime = birthTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("How Old Are You?"),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.red, Colors.blue])))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 14, 213)),
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(Icons.find_in_page),
                  label: Text("Pick Birthdate")),
            ),
            Text(
                "Current Birthdate: ${DateFormat.yMMMMEEEEd().format(birthdate)}"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 209, 21, 21)),
                  onPressed: () {
                    Duration dateDiff = DateTime.now().difference(birthdate);
                    setState(() {
                      years = (dateDiff.inDays / 365).toStringAsFixed(0);
                      months = (double.parse(years) * 12).toString();
                      days = dateDiff.inDays.toString();
                      minutes = dateDiff.inMinutes.toString();
                      seconds = dateDiff.inSeconds.toString();
                    });
                  },
                  icon: Icon(Icons.calculate),
                  label: Text("Calculate")),
            ),
            if (seconds != "")
              Column(
                children: [
                  Text("You are $years years old"),
                  Text("You are $months months old"),
                  Text("You are $days days old"),
                  Text("You are $minutes minutes old"),
                  Text("You are $seconds seconds old")
                ],
              )
          ],
        ),
      ),
    );
  }
}
