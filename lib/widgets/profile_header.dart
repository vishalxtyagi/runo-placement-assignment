import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class ProfileHeader extends StatelessWidget {
  final BuildContext context;
  final ProfileData data;

  const ProfileHeader({super.key, required this.context, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile_picture.jpg'),
        ),
        const SizedBox(height: 16),
        Text(data.name, style: Theme.of(context).textTheme.headlineMedium),
        Text(data.title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(data.email),
        Text(data.phone),
        Text('LinkedIn: ${data.linkedin}'),
        Text('GitHub: ${data.github}'),
      ],
    );
  }
}