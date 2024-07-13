import 'package:flutter/material.dart';


class DatepickerScreen extends StatefulWidget {
  @override
  State<DatepickerScreen> createState() => _DatepickerScreenState();
}

class _DatepickerScreenState extends State<DatepickerScreen> {
  late DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      print('Selected date: $selectedDate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePicker Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DatePicker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selected Date:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${selectedDate.toString()}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Select Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
