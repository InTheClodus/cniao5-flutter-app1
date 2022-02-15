import 'package:equatable/equatable.dart';

import 'lessons.dart';

class CourseLesson extends Equatable {
  final String beginTime;
  final String brief;
  final int bsort;
  final String coverUrl;
  final dynamic createdTime;
  final String endTime;
  final int id;
  final int isOpen;
  final List<Lesson> lessons;
  final int rank;
  final dynamic teacher;
  final String title;

  const CourseLesson({
    this.beginTime,
    this.brief,
    this.bsort,
    this.coverUrl,
    this.createdTime,
    this.endTime,
    this.id,
    this.isOpen,
    this.lessons,
    this.rank,
    this.teacher,
    this.title,
  });

  factory CourseLesson.fromJson(Map<String, dynamic> json) => CourseLesson(
        beginTime: json['begin_time'] as String,
        brief: json['brief'] as String,
        bsort: json['bsort'] as int,
        coverUrl: json['cover_url'] as String,
        createdTime: json['created_time'],
        endTime: json['end_time'] as String,
        id: json['id'] as int,
        isOpen: json['is_open'] as int,
        lessons: (json['lessons'] as List<dynamic>)
            ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
            .toList(),
        rank: json['rank'] as int,
        teacher: json['teacher'],
        title: json['title'] as String,
      );

  Map<String, dynamic> toJson() => {
        'begin_time': beginTime,
        'brief': brief,
        'bsort': bsort,
        'cover_url': coverUrl,
        'created_time': createdTime,
        'end_time': endTime,
        'id': id,
        'is_open': isOpen,
        'lessons': lessons?.map((e) => e.toJson()).toList(),
        'rank': rank,
        'teacher': teacher,
        'title': title,
      };

  CourseLesson copyWith({
    String beginTime,
    String brief,
    int bsort,
    String coverUrl,
    dynamic createdTime,
    String endTime,
    int id,
    int isOpen,
    List<Lesson> lessons,
    int rank,
    dynamic teacher,
    String title,
  }) {
    return CourseLesson(
      beginTime: beginTime ?? this.beginTime,
      brief: brief ?? this.brief,
      bsort: bsort ?? this.bsort,
      coverUrl: coverUrl ?? this.coverUrl,
      createdTime: createdTime ?? this.createdTime,
      endTime: endTime ?? this.endTime,
      id: id ?? this.id,
      isOpen: isOpen ?? this.isOpen,
      lessons: lessons ?? this.lessons,
      rank: rank ?? this.rank,
      teacher: teacher ?? this.teacher,
      title: title ?? this.title,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      beginTime,
      brief,
      bsort,
      coverUrl,
      createdTime,
      endTime,
      id,
      isOpen,
      lessons,
      rank,
      teacher,
      title,
    ];
  }
}
