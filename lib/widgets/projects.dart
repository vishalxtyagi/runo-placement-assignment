import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class ProjectWidget extends StatelessWidget {
  final BuildContext context;
  final List<Project> projects;

  const ProjectWidget(
      {super.key, required this.context, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Projects', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...projects.map((project) => _projectItem(project)),
          ],
        ),
      ),
    );
  }

  Widget _projectItem(Project project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(project.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(project.description),
        Wrap(
          spacing: 8,
          children: project.technologies
              .map((tech) => Chip(label: Text(tech)))
              .toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
