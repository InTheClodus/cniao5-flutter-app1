import 'package:cainiaowo/business/course_detail/view/detail_page.dart';
import 'package:cainiaowo/business/home/home.dart';
import 'package:cainiaowo/business/login/login.dart';
import 'package:cainiaowo/business/play/view/lesson_play.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return HomePage();
});

Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LoginPage();
});

Handler courseDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CourseDetailPage(
    courseId: int.parse(parameters['courseId'][0]),
  );
});

Handler lessonPlayHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return LessonPlayPage(
    courseId: int.parse(parameters['courseId'][0]),
    lessonKey: parameters['lessonKey'][0],
  );
});

Handler emptyHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return Container();
});
