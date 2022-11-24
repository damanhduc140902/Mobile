import 'package:flutter/material.dart';
import 'title_text_1.dart';

class DatePicker1 extends StatefulWidget {
  @override
  DatePicker1State createState() => DatePicker1State();
}

class DatePicker1State extends State<DatePicker1> {
  DateTime dateTime = DateTime.now();
  bool isFirstTime = true;

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.light(primary: Color.fromARGB(255, 35, 111, 87)),
        ),
        child: child as Widget,
      ),
    );
    if (newDate == null) return;
    setState(() {
      this.dateTime = newDate;
    });
  }

  String getText() {
    if (isFirstTime == true) {
      isFirstTime = false;
      return 'Chọn ngày';
    }
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {
        pickDate(context);
      },
      child: TitleText1(
          text: getText(),
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          r: 0,
          g: 0,
          b: 0),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 250, 250, 250))),
    );
  }
}
