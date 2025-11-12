import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String timeRemaining() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      final past = now.difference(exam.dateTime);
      final days = past.inDays;
      final hours = past.inHours.remainder(24);
      return 'Испитот е поминат пред: $days дена, $hours часа';
    } else {
      final days = diff.inDays;
      final hours = diff.inHours.remainder(24);

      return '$days дена, $hours часа';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final timeStr = DateFormat('HH:mm').format(exam.dateTime);
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final Color backgroundColor = diff.isNegative ? Color.fromARGB(255, 200, 255, 187) : Color.fromARGB(255, 253, 255, 151)!;

    return Scaffold(
      appBar: AppBar(title: Text(exam.name), backgroundColor: backgroundColor),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(children: [const Icon(Icons.calendar_today), const SizedBox(width:8), Text('Датум: $dateStr')]),
            const SizedBox(height:8),
            Row(children: [const Icon(Icons.access_time), const SizedBox(width:8), Text('Време: $timeStr')]),
            const SizedBox(height:8),
            Row(children: [const Icon(Icons.room), const SizedBox(width:8), Text('Простории: ' + exam.rooms.join(', '))]),
            const SizedBox(height:20),
            Text('Време до испитот:', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height:8),
            Text(timeRemaining(), style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
