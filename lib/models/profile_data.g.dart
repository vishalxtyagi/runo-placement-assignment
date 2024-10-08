// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      name: json['name'] as String,
      title: json['title'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      education: Education.fromJson(json['education'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      experience: (json['experience'] as List<dynamic>)
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      openSourceContributions: (json['openSourceContributions']
              as List<dynamic>)
          .map(
              (e) => OpenSourceContribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      hackathons: (json['hackathons'] as List<dynamic>)
          .map((e) => Hackathon.fromJson(e as Map<String, dynamic>))
          .toList(),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'email': instance.email,
      'phone': instance.phone,
      'education': instance.education.toJson(),
      'links': instance.links.map((e) => e.toJson()).toList(),
      'skills': instance.skills,
      'experience': instance.experience.map((e) => e.toJson()).toList(),
      'projects': instance.projects.map((e) => e.toJson()).toList(),
      'openSourceContributions':
          instance.openSourceContributions.map((e) => e.toJson()).toList(),
      'hackathons': instance.hackathons.map((e) => e.toJson()).toList(),
      'achievements': instance.achievements,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      institution: json['institution'] as String,
      degree: json['degree'] as String,
      gpa: json['gpa'] as String,
      duration: json['duration'] as String,
      specialization: json['specialization'] as String,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'institution': instance.institution,
      'degree': instance.degree,
      'gpa': instance.gpa,
      'duration': instance.duration,
      'specialization': instance.specialization,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Experience _$ExperienceFromJson(Map<String, dynamic> json) => Experience(
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      duration: json['duration'] as String,
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'duration': instance.duration,
      'description': instance.description,
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      name: json['name'] as String,
      description: json['description'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'technologies': instance.technologies,
    };

OpenSourceContribution _$OpenSourceContributionFromJson(
        Map<String, dynamic> json) =>
    OpenSourceContribution(
      name: json['name'] as String,
      description: json['description'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OpenSourceContributionToJson(
        OpenSourceContribution instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'technologies': instance.technologies,
    };

Hackathon _$HackathonFromJson(Map<String, dynamic> json) => Hackathon(
      name: json['name'] as String,
      position: json['position'] as String,
      project: json['project'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$HackathonToJson(Hackathon instance) => <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'project': instance.project,
      'year': instance.year,
    };
