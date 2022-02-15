import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String brief;
  final String company;
  final int id;
  final String jobTitle;
  final String logoUrl;
  final String teacherName;

  const Teacher({
    this.brief,
    this.company,
    this.id,
    this.jobTitle,
    this.logoUrl,
    this.teacherName,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        brief: json['brief'] as String,
        company: json['company'] as String,
        id: json['id'] as int,
        jobTitle: json['job_title'] as String,
        logoUrl: json['logo_url'] as String,
        teacherName: json['teacher_name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'brief': brief,
        'company': company,
        'id': id,
        'job_title': jobTitle,
        'logo_url': logoUrl,
        'teacher_name': teacherName,
      };

  Teacher copyWith({
    String brief,
    String company,
    int id,
    String jobTitle,
    String logoUrl,
    String teacherName,
  }) {
    return Teacher(
      brief: brief ?? this.brief,
      company: company ?? this.company,
      id: id ?? this.id,
      jobTitle: jobTitle ?? this.jobTitle,
      logoUrl: logoUrl ?? this.logoUrl,
      teacherName: teacherName ?? this.teacherName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      brief,
      company,
      id,
      jobTitle,
      logoUrl,
      teacherName,
    ];
  }
}
