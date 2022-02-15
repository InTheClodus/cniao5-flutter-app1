import 'dart:ui';

import 'package:cainiaowo/business/common/utils_string.dart';
import 'package:cainiaowo/business/course_detail/bloc/coursedetail_bloc.dart';
import 'package:cainiaowo/business/course_detail/models/course_comment.dart';
import 'package:cainiaowo/business/course_detail/models/course_lesson.dart';
import 'package:cainiaowo/business/course_detail/models/lessons.dart';
import 'package:cainiaowo/business/course_detail/view/lesson_list.dart';
import 'package:cainiaowo/common/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class CourseDetailPage extends StatefulWidget {
  CourseDetailPage({
    Key key,
    @required this.courseId,
  }) : super(key: key);

  final int courseId;

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final CourseDetailBloc coursedetailBloc = CourseDetailBloc();

  @override
  void initState() {
    coursedetailBloc.add(CourseDetailEventLoadData(widget.courseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocProvider(
        create: (context) => coursedetailBloc,
        child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
          buildWhen: (previous, current) {
            return current.courseDetail != null;
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: _slivers(state),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _slivers(CourseDetailState state) {
    List<Widget> slivers = [];

    slivers.add(_appBar());
    slivers.add(_detailHeader());
    slivers.add(_sepLine());
    slivers.add(_sectionBar());
    slivers.add(_teacherDesc());
    slivers.add(_sepLine());
    slivers.add(_courseDesc());
    slivers.add(_sepLine());
    slivers.addAll(_lessionsList(state.lessons));
    slivers.add(_sepLine());
    slivers.addAll(_commentsList());

    slivers.add(SliverToBoxAdapter(
      child: Container(
        height: 50,
        color: Colors.white,
      ),
    ));

    return slivers;
  }

  Widget _appBar() {
    return SliverAppBar(
      title: Text('课程详情'),
      backgroundColor: Color(0xFFFC9900),
      floating: false,
      snap: false,
      pinned: true,
      expandedHeight: 210,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          CNWFonts.back,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<CourseDetailBloc, CourseDetailState>(
              builder: (context, state) {
                return Image.network(
                  UtilsString.fixedHttpStart(state.courseDetail?.imgUrl ?? ""),
                  fit: BoxFit.fill,
                );
              },
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Colors.white10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailHeader() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                builder: (context, state) {
                  return Text(
                    state.courseDetail?.name ?? '',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                builder: (context, state) {
                  return Text(
                    "类别：${state.courseDetail?.firstCategory?.title ?? ""}   ${state.courseDetail?.lessonsPlayedTime} 学习    ${state.courseDetail?.lessonsCount} 课时",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 15,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocBuilder<CourseDetailBloc, CourseDetailState>(
                      builder: (context, state) {
                        return Text(
                          state.courseDetail?.nowPrice.toString() ?? '',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFFB2E06),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                        builder: (context, state) {
                          return Text(
                            state.courseDetail?.costPrice.toString() ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF999999),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Color(0xFF999999),
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sepLine() {
    return SliverToBoxAdapter(
      child: Divider(
        height: 20,
        thickness: 20,
        color: Color(0x33666666),
      ),
    );
  }

  Widget _sectionBar() {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('介绍',
                          style: TextStyle(
                            color: Color(0xFFFC9900), //Color(0xFF999999),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          )),
                    )),
                Container(
                  color: Color(0xFFFC9900),
                  width: 20,
                  height: 3,
                ),
              ]),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('目录',
                        style: TextStyle(
                          color: Color(0xFF999999), //Color(0xFF999999),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        )),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('评价',
                        style: TextStyle(
                          color: Color(0xFF999999), //Color(0xFF999999),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        )),
                  )),
            ],
          )),
    );
  }

  Widget _teacherDesc() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '讲师介绍',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: ClipOval(
                      child: Container(
                        color: Color(0x33999999),
                        child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                          builder: (context, state) {
                            return Image.network(
                              UtilsString.fixedHttpStart(
                                  state.courseDetail?.teacher?.logoUrl ?? ""),
                              width: 60,
                              height: 60,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.courseDetail?.teacher?.teacherName ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${state.courseDetail?.teacher?.company}·${state.courseDetail?.teacher?.teacherName}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Divider(
                                  endIndent: 12,
                                  height: 10,
                                  thickness: 1,
                                  color: Color(0x33999999),
                                ),
                                Text(
                                  state.courseDetail?.teacher?.brief ?? '',
                                  // maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF999999),
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ]),
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _courseDesc() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '课程介绍',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            BlocBuilder<CourseDetailBloc, CourseDetailState>(
              builder: (context, state) {
                return Html(
                  data: """${state.courseDetail?.desc}""",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _lessionsList(List<CourseLesson> lessons) {
    List<Widget> _lessions = [];

    _lessions.add(SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(
          '章节',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    ));

    _lessions.addAll(lessons
        .map((CourseLesson lesson) => LessonList(
              lesson: lesson,
              courseId: widget.courseId,
            ))
        .toList());

    return _lessions;
  }

  List<Widget> _commentsList() {
    List<Widget> _comments = [];

    _comments.add(SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(
          '评价',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    ));

    _comments.add(
      BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) {
          return state.comments.length > 0
              ? SliverList(
                  delegate: SliverChildBuilderDelegate((content, index) {
                    CourseComment comment = state.comments[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: ClipOval(
                                  child: Container(
                                    color: Color(0x33999999),
                                    child: Image.network(
                                      UtilsString.fixedHttpStart(
                                          comment.user.logoUrl ?? ""),
                                      width: 45,
                                      height: 45,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  comment.user.username ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  CNWFonts.star,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                              Icon(
                                CNWFonts.star,
                                size: 20,
                                color: Colors.red,
                              ),
                              Icon(
                                CNWFonts.star,
                                size: 20,
                                color: Colors.red,
                              ),
                              Icon(
                                CNWFonts.star_un,
                                size: 20,
                                color: Colors.red,
                              ),
                              Icon(
                                CNWFonts.star_un,
                                size: 20,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            comment.comment ?? '',
                            // maxLines: 3,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF999999),
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Divider(
                            indent: 14,
                            endIndent: 14,
                            height: 1,
                            thickness: 1,
                            color: Color(0x33999999),
                          ),
                        ),
                      ],
                    );
                  }, childCount: state.comments.length),
                )
              : SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CNWFonts.no_data,
                        size: 70,
                        color: Color(0xFF999999),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 25,
                        ),
                        child: Text(
                          '暂无评论',
                          // maxLines: 3,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF999999),
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );

    return _comments;
  }
}
