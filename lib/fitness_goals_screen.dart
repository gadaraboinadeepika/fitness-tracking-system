
import 'package:flutter/material.dart';

class FitnessGoalsScreen extends StatefulWidget {
  const FitnessGoalsScreen({super.key});

  @override
  State<FitnessGoalsScreen> createState() =>
      _FitnessGoalsScreenState();
}

class _FitnessGoalsScreenState
    extends State<FitnessGoalsScreen> {
  double steps = 6250;
  double water = 1200;
  double workout = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Fitness Goals'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Track Your Goals',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Update your daily activity progress.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),
          goalCard(
            title: 'Daily Steps',
            icon: Icons.directions_walk,
            current: steps,
            target: 8000,
            unit: 'steps',
            onChanged: (value) {
              setState(() => steps = value);
            },
          ),
          goalCard(
            title: 'Water Intake',
            icon: Icons.water_drop,
            current: water,
            target: 2000,
            unit: 'ml',
            onChanged: (value) {
              setState(() => water = value);
            },
          ),
          goalCard(
            title: 'Workout Duration',
            icon: Icons.timer,
            current: workout,
            target: 45,
            unit: 'minutes',
            onChanged: (value) {
              setState(() => workout = value);
            },
          ),
          const SizedBox(height: 20),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Keep going! Small daily improvements '
                'can help build healthy habits.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget goalCard({
    required String title,
    required IconData icon,
    required double current,
    required double target,
    required String unit,
    required ValueChanged<double> onChanged,
  }) {
    final progress = (current / target).clamp(0.0, 1.0);

    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green, size: 30),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${current.round()} / ${target.round()} $unit',
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              minHeight: 9,
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              backgroundColor: Colors.grey.shade300,
            ),
            Slider(
              value: current.clamp(0.0, target),
              min: 0,
              max: target,
              divisions: target.round(),
              activeColor: Colors.green,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

