import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    void _onSelectDay(selectedday, focusedDay) {
      if (!isSameDay(_selectedDay, selectedday)) {
        setState(() {
          _selectedDay = selectedday;
          _focusedDay = focusedDay;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child: TableCalendar(
                locale: 'en_US',
                calendarStyle: CalendarStyle(),
                availableGestures: AvailableGestures.all,
                onDaySelected: _onSelectDay,
                selectedDayPredicate: (day) => isSameDay(day, _focusedDay),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(1950),
                lastDay: DateTime.utc(2050)),
          )
        ],
      ),
    );
  }
}
