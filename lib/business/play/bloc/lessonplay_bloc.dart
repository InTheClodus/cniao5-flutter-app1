import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cainiaowo/business/course_detail/models/course_detail.dart';
import 'package:cainiaowo/business/course_detail/models/course_lesson.dart';
import 'package:cainiaowo/business/play/models/lesson_urls.dart';
import 'package:cainiaowo/network/course_detail/net_coursedetail.dart';
import 'package:cainiaowo/network/play/net_play.dart';
import 'package:equatable/equatable.dart';

part 'lessonplay_event.dart';
part 'lessonplay_state.dart';

class LessonPlayBloc extends Bloc<LessonPlayEvent, LessonPlayState> {
  LessonPlayBloc() : super(LessonPlayState());

  @override
  Stream<LessonPlayState> mapEventToState(
    LessonPlayEvent event,
  ) async* {
    if (event is LessonPlayEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    } else if (event is LessonPlayEventChangeLesson) {
      yield* _mapChangeLessonToState(event, state);
    }
  }

  Stream<LessonPlayState> _mapLoadDataToState(
    LessonPlayEvent event,
    LessonPlayState state,
  ) async* {
    int courseId = (event as LessonPlayEventLoadData).courseId;
    String lessonKey = (event as LessonPlayEventLoadData).lessonKey;
    // 请求课程详情
    Map map = await CNWCourseDetailNetManager.courseDetail(courseId: courseId);
    CourseDetail detail = CourseDetail.fromJson(map);

    // 请求课程章节列表
    List list =
        await CNWCourseDetailNetManager.courseLessons(courseId: courseId);
    List<CourseLesson> lessons = List<Map>.from(list)
        .map((dynamic e) => CourseLesson.fromJson(e))
        .toList();

    Map lessonMap = await CNWPlayNetManager.lessonUrls(lessonKey);
    LessonUrls urls = lessonMap != null ? LessonUrls.fromJson(lessonMap) : null;

    yield state.copyWith(
      courseDetail: detail,
      lessons: lessons,
      lessonUrls: urls,
    );
  }

  Stream<LessonPlayState> _mapChangeLessonToState(
    LessonPlayEvent event,
    LessonPlayState state,
  ) async* {
    String lessonKey = (event as LessonPlayEventChangeLesson).lessonKey;

    Map lessonMap = await CNWPlayNetManager.lessonUrls(lessonKey);
    LessonUrls urls = lessonMap != null ? LessonUrls.fromJson(lessonMap) : null;

    yield state.copyWith(
      lessonUrls: urls,
    );
  }
}
