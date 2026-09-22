```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessTrackingApp());
}

class FitnessTrackingApp extends StatelessWidget {
  const FitnessTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Tracking System',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const FitnessHomePage(),
    );
  }
}

class FitnessHomePage extends StatelessWidget {
  const FitnessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tracking System'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Deepika 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Track your daily fitness activity',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Today's Activity",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: activityCard(
                    Icons.directions_walk,
                    'Steps',
                    '6250',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: activityCard(
                    Icons.local_fire_department,
                    'Calories',
                    '420 kcal',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: activityCard(
                    Icons.water_drop,
                    'Water',
                    '1.8 L',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: activityCard(
                    Icons.timer,
                    'Workout',
                    '45 min',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.fitness_center,
                    color: Colors.white,
                    size: 45,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ready for a Workout?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Workout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activityCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.green,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Step 4 — Save the Notepad file

Press:

**Ctrl + S**

Then **close Notepad**.

### Step 5 — Verify

Back in PowerShell, type:

```powershell
type lib\main.dart
```

The first line should be:

```text
import 'package:flutter/material.dart';
```

and you should see:

```text
runApp(const FitnessTrackingApp());
```

**Don't run Git yet.** Send me the first few lines/output after this check.
