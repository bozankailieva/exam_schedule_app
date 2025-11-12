import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Exam> _exams = [
    Exam(name: 'Управување со ИКТ проекти', dateTime: DateTime(2025, 11, 11, 13, 0), rooms: ['Амфи ФИНКИ Г']),
    Exam(name: 'Бази на податоци', dateTime: DateTime(2025, 11, 24, 9, 0), rooms: ['Лаб 117']),
    Exam(name: 'Мобилни информмациски системи', dateTime: DateTime(2025, 11, 23, 11, 0), rooms: ['Лаб 117']),
    Exam(name: 'Интегрирани системи', dateTime: DateTime(2025, 11, 24, 12, 0), rooms: ['200АБ']),
    Exam(name: 'Бизнис', dateTime: DateTime(2025, 11, 10, 15, 0), rooms: ['Лаб 138']),
    Exam(name: 'Веројатност и статистика', dateTime: DateTime(2025, 11, 19, 8, 30), rooms: ['Амфи МФ']),
    Exam(name: 'Компјутерски мрежи и безбедност', dateTime: DateTime(2025, 11, 8, 11, 0), rooms: ['Лаб 215']),
    Exam(name: 'Компјутерска архитектура', dateTime: DateTime(2025, 12, 12, 10, 30), rooms: ['лаб 138']),
    Exam(name: 'Софтверско инженерство', dateTime: DateTime(2025, 12, 8, 9, 15), rooms: ['Лаб 2']),
    Exam(name: 'Веб програмирање', dateTime: DateTime(2025, 12, 5, 14, 30), rooms: ['ЛАБ 138']),
    Exam(name: 'Дигитални библиотеки', dateTime: DateTime(2025, 12, 5, 17, 30), rooms: ['ЛАБ 3']),
  ];

  @override
  Widget build(BuildContext context) {
    final exams = List<Exam>.from(_exams)..sort((a,b) => a.dateTime.compareTo(b.dateTime));
    final total = exams.length;
    const indexNumber = '211257';

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber',textAlign: TextAlign.center),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: exams.length,
              itemBuilder: (context, idx) {
                final exam = exams[idx];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ExamDetailScreen(exam: exam),
                    ));
                  },
                  child: ExamCard(exam: exam),
                );
              },
            ),
          ),
          //total exams counter
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Center(
                child: Chip(
                  label: Text('Вкупно испити: $total', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
