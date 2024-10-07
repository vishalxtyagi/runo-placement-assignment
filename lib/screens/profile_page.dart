import 'package:flutter/material.dart';
import 'package:profile/models/profile_data.dart';
import 'package:profile/widgets/achievements.dart';
import 'package:profile/widgets/contributions.dart';
import 'package:profile/widgets/education.dart';
import 'package:profile/widgets/experience.dart';
import 'package:profile/widgets/hackathons.dart';
import 'package:profile/widgets/profile_header.dart';
import 'package:profile/widgets/projects.dart';
import 'package:profile/widgets/skills.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vishal Tyagi Profile')),
      body: FutureBuilder<ProfileData>(
        future: ProfileData.load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
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

  Widget _desktopLayout(BuildContext context, ProfileData data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(context: context, data: data),
                const SizedBox(height: 16),
                EducationWidget(context: context, education: data.education),
                const SizedBox(height: 16),
                SkillWidget(context: context, skills: data.skills),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExperienceWidget(context: context, experiences: data.experience),
                const SizedBox(height: 16),
                ProjectWidget(context: context, projects: data.projects),
                const SizedBox(height: 16),
                ContributionWidget(context: context, contributions: data.openSourceContributions),
                const SizedBox(height: 16),
                HackathonWidget(context: context, hackathons: data.hackathons),
                const SizedBox(height: 16),
                AchievementWidget(context: context, achievements: data.achievements),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context, ProfileData data) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(context: context, data: data),
          const SizedBox(height: 16),
          EducationWidget(context: context, education: data.education),
          const SizedBox(height: 16),
          SkillWidget(context: context, skills: data.skills),
          const SizedBox(height: 16),
          ExperienceWidget(context: context, experiences: data.experience),
          const SizedBox(height: 16),
          ProjectWidget(context: context, projects: data.projects),
          const SizedBox(height: 16),
          ContributionWidget(context: context, contributions: data.openSourceContributions),
          const SizedBox(height: 16),
          HackathonWidget(context: context, hackathons: data.hackathons),
          const SizedBox(height: 16),
          AchievementWidget(context: context, achievements: data.achievements),
        ],
      ),
    );
  }
}

