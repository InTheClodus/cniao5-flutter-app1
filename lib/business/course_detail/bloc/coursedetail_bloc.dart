import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cainiaowo/business/course_detail/models/course_comment.dart';
import 'package:cainiaowo/business/course_detail/models/course_detail.dart';
import 'package:cainiaowo/business/course_detail/models/course_lesson.dart';
import 'package:cainiaowo/network/course_detail/net_coursedetail.dart';
import 'package:equatable/equatable.dart';

part 'coursedetail_event.dart';
part 'coursedetail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(CourseDetailState());

  @override
  Stream<CourseDetailState> mapEventToState(
    CourseDetailEvent event,
  ) async* {
    if (event is CourseDetailEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  Stream<CourseDetailState> _mapLoadDataToState(
    CourseDetailEvent event,
    CourseDetailState state,
  ) async* {
    int courseId = (event as CourseDetailEventLoadData).courseId;
    // 请求课程详情
    Map map = await CNWCourseDetailNetManager.courseDetail(courseId: courseId);
    CourseDetail detail = CourseDetail.fromJson(map);

    // 请求课程章节列表
    List list =
        await CNWCourseDetailNetManager.courseLessons(courseId: courseId);
    List<CourseLesson> lessons = List<Map>.from(list)
        .map((dynamic e) => CourseLesson.fromJson(e))
        .toList();

    // 请求课程评论列表
    Map commentMap =
        await CNWCourseDetailNetManager.commentList(courseId: courseId);
    List<CourseComment> comments = List<Map>.from(commentMap['datas'])
        .map((dynamic e) => CourseComment.fromJson(e))
        .toList();

    yield state.copyWith(
      courseDetail: detail,
      lessons: lessons,
      comments: comments,
    );
  }
}
