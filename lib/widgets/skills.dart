import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  final BuildContext context;
  final List<String> skills;

  const SkillWidget({super.key, required this.context, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: skills
              .map((skill) => Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            child: Chip(
                label: Text(
                    skill,
                    style: const TextStyle(
                        fontSize: 12)
                ),
                backgroundColor: Colors.grey[200],
                side: const BorderSide(color: Colors.grey, width: 0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ))
              .toList(),
        )
      ],
    );
  }
}
