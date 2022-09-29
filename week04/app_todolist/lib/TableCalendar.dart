import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Table_Calendar extends StatefulWidget {
  @override
  _Table_CalendarState createState() => _Table_CalendarState();
}

class _Table_CalendarState extends State<Table_Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('New Event'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField(
                  controller: titleController, hint: 'Enter Title'),
              const SizedBox(
                height: 20.0,
              ),
              buildTextField(
                  controller: descpController, hint: 'Enter Description'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isEmpty &&
                    descpController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter title & description'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  //Navigator.pop(context);
                  return;
                } else {
                  setState(() {
                    if (mySelectedEvents[_selectedDay] != null) {
                      mySelectedEvents[_selectedDay]?.add(MyEvents(
                          eventTitle: titleController.text,
                          eventDescp: descpController.text));
                    } else {
                      mySelectedEvents[_selectedDay!] = [
                        MyEvents(
                            eventTitle: titleController.text,
                            eventDescp: descpController.text)
                      ];
                    }
                  });

                  titleController.clear();
                  descpController.clear();

                  Navigator.pop(context);
                  return;
                }
              },
              child: const Text('Add'),
            ),
          ],
        ));
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(62, 45, 64, 1), width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(62, 45, 64, 1), width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: const Text('Add Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(color: Color.fromRGBO(193,193,193, 1), width: 2.0),
              ),

        child: TableCalendar(

          //shouldFillViewport: true,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 12, 12),
          focusedDay: DateTime.now(),
          calendarFormat: _calendarFormat,
          eventLoader: _listOfDayEvents,


          selectedDayPredicate: (day) {
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.

            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
          headerStyle: const HeaderStyle(
            titleTextStyle:
            TextStyle(color: Color.fromRGBO(14, 19, 22, 1), fontSize: 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(235, 245, 254, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            formatButtonTextStyle:
            TextStyle(color: Color.fromRGBO(14, 19, 22, 1), fontSize: 16.0),
            formatButtonDecoration: BoxDecoration(
              color: Color.fromRGBO(254, 254, 250, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ), ),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Color.fromRGBO(14, 19, 22, 1),
              size: 28,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Color.fromRGBO(14, 19, 22, 1),
              size: 28,
            ),
          ),

        ),
              ),
          ..._listOfDayEvents(_selectedDay!).map(
                (myEvents) => ListTile(
              leading: const Icon(
                Icons.check_box_outline_blank,
                color: Color.fromRGBO(62, 45, 64, 1),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Event Title:   ${myEvents.eventTitle}'),
              ),
              subtitle: Text('Description:   ${myEvents.eventDescp}'),
            ),
          ),
          ],
        ),
      ),


    );
  }
}
class MyEvents {
  final String eventTitle;
  final String eventDescp;

  MyEvents({required this.eventTitle, required this.eventDescp});

  @override
  String toString() => eventTitle;
}

