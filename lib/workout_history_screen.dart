
import 'package:flutter/material.dart';

class WorkoutHistoryScreen extends StatelessWidget {
  const WorkoutHistoryScreen({super.key});

  final List<Map<String, String>> workouts = const [
    {
      'name': 'Morning Walk',
      'duration': '30 minutes',
      'calories': '150 kcal',
      'date': 'Today',
    },
    {
      'name': 'Full Body Workout',
      'duration': '45 minutes',
      'calories': '250 kcal',
      'date': 'Yesterday',
    },
    {
      'name': 'Cycling',
      'duration': '25 minutes',
      'calories': '180 kcal',
      'date': '2 days ago',
    },
    {
      'name': 'Stretching',
      'duration': '15 minutes',
      'calories': '60 kcal',
      'date': '3 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.fitness_center,
                  color: Colors.white,
                ),
              ),
              title: Text(
                workout['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '${workout['date']}\n'
                  'Duration: ${workout['duration']}\n'
                  'Calories: ${workout['calories']}',
                ),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
