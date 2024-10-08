import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';
import 'package:profile/widgets/achievements.dart';
import 'package:profile/widgets/contributions.dart';
import 'package:profile/widgets/education.dart';
import 'package:profile/widgets/experience.dart';
import 'package:profile/widgets/hackathons.dart';
import 'package:profile/widgets/links.dart';
import 'package:profile/widgets/profile_header.dart';
import 'package:profile/widgets/projects.dart';
import 'package:profile/widgets/skills.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<ProfileData>(
        future: ProfileData.load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showQuickAlert(context);
            });
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return _desktopLayout(context, snapshot.data!);
                } else {
                  return _mobileLayout(context, snapshot.data!);
                }
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  void _showQuickAlert(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: 'Still in Development',
      text: 'I received this assignment yesterday at 4 PM, which is outside the two-day timeframe mentioned. I\'m actively working on the project, and I will update the APK on GitHub once it’s ready. You can download the latest update from there.',
      confirmBtnText: 'Proceed',
      onConfirmBtnTap: () {
        _launchURL();  // Launch GitHub URL for the updated APK
      },
    );
  }

  // Function to open the GitHub release link
  void _launchURL() async {
    const url = 'https://github.com/vishalxtyagi/runo-placement-assignment/releases'; // Add your GitHub release link here
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget _desktopLayout(BuildContext context, ProfileData data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(data: data, isDesktop: true),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EducationWidget(education: data.education),
                      const SizedBox(height: 16),
                      ExperienceWidget(
                          context: context, experiences: data.experience),
                      const SizedBox(height: 16),
                      ProjectWidget(context: context, projects: data.projects),
                      const SizedBox(height: 16),
                      ContributionWidget(
                          context: context,
                          contributions: data.openSourceContributions),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinkWidget(links: data.links),
                      const SizedBox(height: 16),
                      SkillWidget(context: context, skills: data.skills),
                      const SizedBox(height: 16),
                      AchievementWidget(achievements: data.achievements),
                      const SizedBox(height: 16),
                      HackathonWidget(
                          context: context, hackathons: data.hackathons),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mobileLayout(BuildContext context, ProfileData data) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(data: data),
          const SizedBox(height: 100),
          EducationWidget(education: data.education),
          const SizedBox(height: 16),
          SkillWidget(context: context, skills: data.skills),
          const SizedBox(height: 16),
          ExperienceWidget(context: context, experiences: data.experience),
          const SizedBox(height: 16),
          ProjectWidget(context: context, projects: data.projects),
          const SizedBox(height: 16),
          ContributionWidget(
              context: context, contributions: data.openSourceContributions),
          const SizedBox(height: 16),
          HackathonWidget(context: context, hackathons: data.hackathons),
          const SizedBox(height: 16),
          AchievementWidget(achievements: data.achievements),
        ],
      ),
    );
  }
}
