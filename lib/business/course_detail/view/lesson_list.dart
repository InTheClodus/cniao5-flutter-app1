import 'package:cainiaowo/business/course_detail/models/course_lesson.dart';
import 'package:cainiaowo/business/course_detail/models/lessons.dart';
import 'package:cainiaowo/common/application.dart';
import 'package:cainiaowo/common/icons.dart';
import 'package:cainiaowo/router/routes.dart';
import 'package:flutter/material.dart';

typedef LessonListTapUpCallback = void Function(Lesson lesson);

class LessonList extends StatelessWidget {
  const LessonList({
    Key key,
    @required this.lesson,
    @required this.courseId,
    this.onTap,
  }) : super(key: key);

  final CourseLesson lesson;
  final int courseId;
  final LessonListTapUpCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (content, index) {
          return index == 0
              ? _sectionTitle(title: "第${lesson.bsort}章：${lesson.title}")
              : _lessionCell(lesson.lessons[index], context);
        },
        childCount: lesson.lessons.length,
      ),
      itemExtent: 55,
    );
  }

  Widget _sectionTitle({String title = ""}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Text(title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          )),
    );
  }

  Widget _lessionCell(Lesson lesson, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap(lesson);
        } else {
          Application.router.navigateTo(context,
              '${Routes.lessonPlay}?courseId=$courseId&lessonKey=${lesson.key}');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CNWFonts.play,
                    size: 15,
                    color: Color(0xFF222222),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(lesson.name ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        )),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 25,
              endIndent: 14,
              height: 1,
              thickness: 1,
              color: Color(0x33999999),
            ),
          ],
        ),
      ),
    );
  }
}
