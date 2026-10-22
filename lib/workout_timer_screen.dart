
import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutTimerScreen extends StatefulWidget {
  const WorkoutTimerScreen({super.key});

  @override
  State<WorkoutTimerScreen> createState() =>
      _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState
    extends State<WorkoutTimerScreen> {
  int seconds = 60;
  Timer? timer;

  void startTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          t.cancel();
          setState(() {});
        }
      },
    );
  }

  void pauseTimer() {
    timer?.cancel();
    setState(() {});
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      seconds = 60;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds =
        (seconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Timer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.timer,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              '$minutes:$remainingSeconds',
              style: const TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('60-second workout timer'),
            const SizedBox(height: 25),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: seconds > 0 ? startTimer : null,
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: timer?.isActive == true
                      ? pauseTimer
                      : null,
                  child: const Text('Pause'),
                ),
                OutlinedButton(
                  onPressed: resetTimer,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
