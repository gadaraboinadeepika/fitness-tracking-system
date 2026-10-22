
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                size: 65,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Deepika',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Fitness Enthusiast',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            profileCard(
              Icons.flag,
              'Fitness Goal',
              'Stay Active and Healthy',
            ),
            profileCard(
              Icons.directions_walk,
              'Daily Step Goal',
              '8,000 steps',
            ),
            profileCard(
              Icons.water_drop,
              'Daily Water Goal',
              '2,000 ml',
            ),
            profileCard(
              Icons.timer,
              'Workout Target',
              '45 minutes daily',
            ),
            const SizedBox(height: 20),
            const Text(
              'Keep moving towards your goals!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green,
          size: 30,
        ),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}

