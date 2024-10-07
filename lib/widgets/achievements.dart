import 'package:flutter/material.dart';

class AchievementWidget extends StatelessWidget {
  final BuildContext context;
  final List<String> achievements;

  const AchievementWidget({super.key, required this.context, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Achievements', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            ...achievements.map((achievement) => Text('• $achievement')),
          ],
        ),
      ),
    );
  }

}