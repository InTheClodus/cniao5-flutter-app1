part of 'coursedetail_bloc.dart';

abstract class CourseDetailEvent extends Equatable {
  const CourseDetailEvent();

  @override
  List<Object> get props => [];
}

class CourseDetailEventLoadData extends CourseDetailEvent {
  const CourseDetailEventLoadData(this.courseId);

  final int courseId;
}
