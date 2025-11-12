import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final passed = exam.dateTime.isBefore(now);
    final dateFormatted = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final timeFormatted = DateFormat('HH:mm').format(exam.dateTime);
    final roomText = exam.rooms.join(', ');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: passed ? const Color.fromARGB(255, 200, 255, 187) : const Color.fromARGB(255, 253, 255, 151),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(exam.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                Icon(passed ? Icons.check_circle : Icons.schedule, color: passed ? Colors.green : Colors.orange),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 6),
                Text(dateFormatted),
                const SizedBox(width: 12),
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 6),
                Text(timeFormatted),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text(roomText)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
