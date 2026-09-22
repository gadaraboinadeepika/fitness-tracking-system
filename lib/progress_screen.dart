import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Goals'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Fitness Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            goalCard(
              Icons.directions_walk,
              'Daily Steps',
              '6250 / 10000',
              0.625,
            ),

            goalCard(
              Icons.water_drop,
              'Water Intake',
              '1.8 L / 3 L',
              0.6,
            ),

            goalCard(
              Icons.fitness_center,
              'Workout',
              '45 / 60 min',
              0.75,
            ),
          ],
        ),
      ),
    );
  }

  Widget goalCard(
    IconData icon,
    String title,
    String value,
    double progress,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.green,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(value),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }
}