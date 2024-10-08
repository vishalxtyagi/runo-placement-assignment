import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class ContributionWidget extends StatelessWidget {
  final BuildContext context;
  final List<OpenSourceContribution> contributions;

  const ContributionWidget(
      {super.key, required this.context, required this.contributions});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Open Source Contributions',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...contributions.map((contrib) => _contributionItem(contrib)),
          ],
        ),
      ),
    );
  }

  Widget _contributionItem(OpenSourceContribution contrib) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(contrib.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(contrib.description),
        Wrap(
          spacing: 8,
          children: contrib.technologies
              .map((tech) => Chip(label: Text(tech)))
              .toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
