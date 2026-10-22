
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool remindersEnabled = true;
  bool darkModeEnabled = false;
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Preferences',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: SwitchListTile(
              secondary: const Icon(
                Icons.notifications_active,
                color: Colors.green,
              ),
              title: const Text('Fitness Reminders'),
              subtitle: const Text(
                'Enable daily activity reminders',
              ),
              value: remindersEnabled,
              onChanged: (value) {
                setState(() {
                  remindersEnabled = value;
                });
              },
            ),
          ),
          Card(
            child: SwitchListTile(
              secondary: const Icon(
                Icons.dark_mode,
                color: Colors.green,
              ),
              title: const Text('Dark Mode Preference'),
              subtitle: const Text(
                'Save your preferred display mode',
              ),
              value: darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                });
              },
            ),
          ),
          Card(
            child: SwitchListTile(
              secondary: const Icon(
                Icons.volume_up,
                color: Colors.green,
              ),
              title: const Text('Sound'),
              subtitle: const Text(
                'Enable app sound preference',
              ),
              value: soundEnabled,
              onChanged: (value) {
                setState(() {
                  soundEnabled = value;
                });
              },
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(
                Icons.fitness_center,
                color: Colors.green,
              ),
              title: Text('Fitness Tracking System'),
              subtitle: Text('Version 1.0.0'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Stay Active'),
              subtitle: Text(
                'Small steps lead to healthy habits.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
