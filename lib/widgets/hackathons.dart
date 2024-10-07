import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class HackathonWidget extends StatelessWidget {
  final BuildContext context;
  final List<Hackathon> hackathons;

  const HackathonWidget({super.key, required this.context, required this.hackathons});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hackathons', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            ...hackathons.map((hackathon) => _hackathonItem(hackathon)),
          ],
        ),
      ),
    );
  }

  Widget _hackathonItem(Hackathon hackathon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hackathon.name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Position: ${hackathon.position}'),
        Text('Project: ${hackathon.project}'),
        Text('Year: ${hackathon.year}'),
        SizedBox(height: 16),
      ],
    );
  }

}