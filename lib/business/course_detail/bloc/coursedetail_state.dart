part of 'coursedetail_bloc.dart';

class CourseDetailState extends Equatable {
  const CourseDetailState({
    this.lessons = const [],
    this.courseDetail,
    this.comments = const [],
  });

  final List<CourseLesson> lessons;
  final CourseDetail courseDetail;
  final List<CourseComment> comments;

  CourseDetailState copyWith({
    List<CourseLesson> lessons,
    CourseDetail courseDetail,
    List<CourseComment> comments,
  }) {
    return CourseDetailState(
      lessons: lessons ?? this.lessons,
      courseDetail: courseDetail ?? this.courseDetail,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object> get props => [lessons, courseDetail, comments];
}
