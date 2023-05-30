import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achievements',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AchievementsPage(),
    );
  }
}

class Achievement {
  final String name;
  final int requiredPoints;
  final double opacity;

  Achievement({
    required this.name,
    required this.requiredPoints,
    this.opacity = 1.0,
  });
}

class AchievementsPage extends StatelessWidget {
  final List<Achievement> achievements = [
    Achievement(name: 'Card Killer', requiredPoints: 100),
    Achievement(name: 'Dedo Verde', requiredPoints: 300, opacity: 0.5),
    Achievement(name: 'Emissário de Gaia', requiredPoints: 500, opacity: 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: achievements.length,
          itemBuilder: (BuildContext context, int index) {
            final achievement = achievements[index];
            return ListTile(
              title: Text(
                achievement.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle:
                  Text('Pontos Necessários: ${achievement.requiredPoints}'),
              trailing: Opacity(
                opacity: achievement.opacity,
                child: Icon(
                  Icons.emoji_events,
                  size: 32.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
