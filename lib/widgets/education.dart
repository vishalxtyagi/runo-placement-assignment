import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class EducationWidget extends StatelessWidget {
  final BuildContext context;
  final Education education;

  const EducationWidget({super.key, required this.context, required this.education});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Education', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Text(education.institution),
            Text(education.degree),
            Text('GPA: ${education.gpa}'),
            Text(education.duration),
            Text('Specialization: ${education.specialization}'),
          ],
        ),
      ),
    );
  }
}