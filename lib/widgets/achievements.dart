import 'package:flutter/material.dart';

class AchievementWidget extends StatelessWidget {
  final List<String> achievements;

  const AchievementWidget({Key? key, required this.achievements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Achievements',
            style: Theme.of(context).textTheme.titleLarge
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: achievements.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildAchievementItem(context, achievements[index]);
          },
        ),
      ],
    );
  }

  Widget _buildAchievementItem(BuildContext context, String achievement) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.star, color: Colors.amber[600], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            achievement,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}