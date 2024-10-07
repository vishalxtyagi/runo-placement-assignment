import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class ExperienceWidget extends StatelessWidget {
  final BuildContext context;
  final List<Experience> experiences;

  const ExperienceWidget({super.key, required this.context, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Experience', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            ...experiences.map((exp) => _experienceItem(exp)),
          ],
        ),
      ),
    );
  }

  Widget _experienceItem(Experience exp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exp.title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${exp.company} - ${exp.location}'),
        Text(exp.duration),
        ...exp.description.map((desc) => Text('• $desc')).toList(),
        SizedBox(height: 16),
      ],
    );
  }

}