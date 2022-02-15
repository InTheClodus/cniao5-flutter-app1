part of 'lessonplay_bloc.dart';

class LessonPlayState extends Equatable {
  const LessonPlayState({
    this.lessons = const [],
    this.courseDetail,
    this.lessonUrls,
  });

  final List<CourseLesson> lessons;
  final CourseDetail courseDetail;
  final LessonUrls lessonUrls;

  LessonPlayState copyWith({
    List<CourseLesson> lessons,
    CourseDetail courseDetail,
    LessonUrls lessonUrls,
  }) {
    return LessonPlayState(
      lessons: lessons ?? this.lessons,
      courseDetail: courseDetail ?? this.courseDetail,
      lessonUrls: lessonUrls ?? this.lessonUrls,
    );
  }

  @override
  List<Object> get props => [
        lessons,
        courseDetail,
        lessonUrls,
      ];
}
