part of 'lessonplay_bloc.dart';

abstract class LessonPlayEvent extends Equatable {
  const LessonPlayEvent();

  @override
  List<Object> get props => [];
}

class LessonPlayEventLoadData extends LessonPlayEvent {
  const LessonPlayEventLoadData(this.courseId, this.lessonKey);

  final int courseId;
  final String lessonKey;
}

class LessonPlayEventChangeLesson extends LessonPlayEvent {
  const LessonPlayEventChangeLesson(this.lessonKey);

  final String lessonKey;
}
