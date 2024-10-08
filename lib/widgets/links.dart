import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class LinkWidget extends StatelessWidget {
  final List<Link> links;

  const LinkWidget({Key? key, required this.links}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Links',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: links.map((link) => _buildLinkChip(link, constraints)).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLinkChip(Link link, BoxConstraints constraints) {
    bool isWide = constraints.maxWidth > 600;

    return InkWell(
      onTap: () {
        // TODO: Implement link opening functionality
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.deepOrange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.deepOrangeAccent.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getIconForLink(link.name),
              size: 18,
              color: Colors.deepOrange,
            ),
            if (isWide || link == links.first) ...[
              const SizedBox(width: 8),
              Text(
                link.name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getIconForLink(String linkName) {
    switch (linkName.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.business;
      case 'twitter':
        return Icons.chat_bubble;
      case 'facebook':
        return Icons.facebook;
      case 'instagram':
        return Icons.camera_alt;
      default:
        return Icons.link;
    }
  }
}