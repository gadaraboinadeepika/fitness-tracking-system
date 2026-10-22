
import 'package:flutter/material.dart';
import 'water_tracker_screen.dart';
class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  int waterIntake = 0;
  int lastAdded = 0;

  final int dailyGoal = 2000;

  void addWater(int amount) {
    setState(() {
      waterIntake += amount;
      lastAdded = amount;
    });
  }

  void undoWater() {
    if (lastAdded == 0) return;

    setState(() {
      waterIntake = (waterIntake - lastAdded).clamp(0, dailyGoal * 100);
      lastAdded = 0;
    });
  }

  void resetWater() {
    setState(() {
      waterIntake = 0;
      lastAdded = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        (waterIntake / dailyGoal).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Intake Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(
                Icons.water_drop,
                color: Colors.blue,
                size: 90,
              ),
              const SizedBox(height: 16),
              const Text(
                "Today's Water Intake",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '${(waterIntake / 1000).toStringAsFixed(2)} L',
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text('of ${(dailyGoal / 1000).toStringAsFixed(1)} L goal'),
              const SizedBox(height: 24),
              LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.blue.shade100,
                color: Colors.blue,
              ),
              const SizedBox(height: 12),
              Text(
                waterIntake >= dailyGoal
                    ? 'Daily goal reached!'
                    : '${dailyGoal - waterIntake} ml remaining',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              const Text(
                'Add Water',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => addWater(250),
                      icon: const Icon(Icons.local_drink),
                      label: const Text('+250 ml'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => addWater(500),
                      icon: const Icon(Icons.water),
                      label: const Text('+500 ml'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: lastAdded == 0 ? null : undoWater,
                icon: const Icon(Icons.undo),
                label: const Text('Undo Last Addition'),
              ),
              TextButton.icon(
                onPressed: resetWater,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Intake'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tip: Keep water available and drink regularly '
                'throughout the day.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
