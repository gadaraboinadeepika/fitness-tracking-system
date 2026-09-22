import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Tracking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Your Workout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            workoutCard(
              context,
              Icons.directions_run,
              'Running',
              '30 minutes',
            ),

            workoutCard(
              context,
              Icons.directions_walk,
              'Walking',
              '20 minutes',
            ),

            workoutCard(
              context,
              Icons.directions_bike,
              'Cycling',
              '30 minutes',
            ),

            workoutCard(
              context,
              Icons.self_improvement,
              'Yoga',
              '25 minutes',
            ),
          ],
        ),
      ),
    );
  }

  Widget workoutCard(
    BuildContext context,
    IconData icon,
    String title,
    String duration,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green,
          size: 35,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(duration),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Start'),
        ),
      ),
    );
  }
}