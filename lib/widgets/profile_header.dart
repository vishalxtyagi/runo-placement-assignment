import 'dart:math';
import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileData data;
  final bool isDesktop;

  const ProfileHeader({
    Key? key,
    required this.data,
    this.isDesktop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final randomIndex = Random().nextInt(3) + 1;
    final profileImageSize = isDesktop ? 200.0 : 120.0;
    final bannerHeight = isDesktop ? 256.0 : 200.0;
    final profileOverlap = profileImageSize / 2;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Banner Image
            SizedBox(
              width: double.infinity,
              height: bannerHeight,
              child: Image.asset(
                'assets/banners/$randomIndex.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Profile Image Overlapping the Banner
            // if desktop, position it to the left, else center
            Positioned(
              left: isDesktop ? 16 : (MediaQuery.sizeOf(context).width / 2) - (profileImageSize / 1.65),
              bottom: -profileOverlap,
              child: Container(
                width: profileImageSize,
                height: profileImageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Row with Text and Buttons in desktop mode (or only Text in mobile mode)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: isDesktop
              ? Container(
                  margin: EdgeInsets.only(left: profileImageSize + 30),
                child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                // Name and Title Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
                // Buttons aligned to the right in desktop
                Row(
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.email),
                      label: Text('Email'),
                      onPressed: () {
                        // Add your email functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        backgroundColor: Colors.orange, // Primary color
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      icon: Icon(Icons.phone),
                      label: Text('Call'),
                      onPressed: () {
                        // Add your call functionality here
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        side: BorderSide(color: Colors.orange),
                        foregroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                            ],
                          ),
              )
              : Container(
                  margin: EdgeInsets.only(top: 70),
                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                // Name and Title
                Text(
                  data.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  data.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                // Buttons stacked in mobile mode
                Row(
                  mainAxisAlignment: isDesktop ? MainAxisAlignment.end : MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.email),
                      label: Text('Email'),
                      onPressed: () {
                        // Add your email functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      icon: Icon(Icons.phone),
                      label: Text('Call'),
                      onPressed: () {
                        // Add your call functionality here
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        side: BorderSide(color: Colors.orange),
                        foregroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                            ],
                          ),
              ),
        ),
      ],
    );
  }
}
