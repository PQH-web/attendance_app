import 'package:flutter/material.dart';

void main() {
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<String> _attendees = [];
  final _nameController = TextEditingController();

  void _addAttendee() {
    final name = _nameController.text;
    if (name.isNotEmpty) {
      setState(() {
        _attendees.add(name);
      });
      _nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addAttendee,
            child: Text('Check In'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _attendees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_attendees[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
