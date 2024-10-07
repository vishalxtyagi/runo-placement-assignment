import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class SkillWidget extends StatelessWidget {
  final BuildContext context;
  final Skills skills;

  const SkillWidget({super.key, required this.context, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Skills', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            _skillCategory('Languages', skills.Languages),
            _skillCategory('Frameworks', skills.Frameworks),
            _skillCategory('Tools', skills.Tools),
            _skillCategory('Platforms', skills.Platforms),
          ],
        ),
      ),
    );
  }

  Widget _skillCategory(String category, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: skills.map((skill) => Chip(label: Text(skill))).toList(),
        ),
        SizedBox(height: 8),
      ],
    );
  }

}