import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

part 'profile_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileData {
  final String name;
  final String title;
  final String email;
  final String phone;
  final Education education;
  final List<Link> links;
  final List<String> skills;
  final List<Experience> experience;
  final List<Project> projects;
  final List<OpenSourceContribution> openSourceContributions;
  final List<Hackathon> hackathons;
  final List<String> achievements;

  ProfileData({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.education,
    required this.links,
    required this.skills,
    required this.experience,
    required this.projects,
    required this.openSourceContributions,
    required this.hackathons,
    required this.achievements,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);

  static Future<ProfileData> load() async {
    final jsonString = await rootBundle.loadString('assets/profile_data.json');
    final jsonData = json.decode(jsonString);
    return ProfileData.fromJson(jsonData);
  }
}

@JsonSerializable()
class Education {
  final String institution;
  final String degree;
  final String gpa;
  final String duration;
  final String specialization;

  Education({
    required this.institution,
    required this.degree,
    required this.gpa,
    required this.duration,
    required this.specialization,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
  Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable()
class Link {
  final String name;
  final String url;

  Link({
    required this.name,
    required this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class Experience {
  final String title;
  final String company;
  final String location;
  final String duration;
  final List<String> description;

  Experience({
    required this.title,
    required this.company,
    required this.location,
    required this.duration,
    required this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}

@JsonSerializable()
class Project {
  final String name;
  final String description;
  final List<String> technologies;

  Project({
    required this.name,
    required this.description,
    required this.technologies,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable()
class OpenSourceContribution {
  final String name;
  final String description;
  final List<String> technologies;

  OpenSourceContribution({
    required this.name,
    required this.description,
    required this.technologies,
  });

  factory OpenSourceContribution.fromJson(Map<String, dynamic> json) =>
      _$OpenSourceContributionFromJson(json);
  Map<String, dynamic> toJson() => _$OpenSourceContributionToJson(this);
}

@JsonSerializable()
class Hackathon {
  final String name;
  final String position;
  final String project;
  final String year;

  Hackathon({
    required this.name,
    required this.position,
    required this.project,
    required this.year,
  });

  factory Hackathon.fromJson(Map<String, dynamic> json) =>
      _$HackathonFromJson(json);
  Map<String, dynamic> toJson() => _$HackathonToJson(this);
}
