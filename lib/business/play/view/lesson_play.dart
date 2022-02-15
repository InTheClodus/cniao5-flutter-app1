import 'package:cainiaowo/business/course_detail/models/course_lesson.dart';
import 'package:cainiaowo/business/course_detail/models/lessons.dart';
import 'package:cainiaowo/business/course_detail/view/lesson_list.dart';
import 'package:cainiaowo/business/index/models/course.dart';
import 'package:cainiaowo/business/index/view/course_cell.dart';
import 'package:cainiaowo/business/play/bloc/lessonplay_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPlayPage extends StatefulWidget {
  LessonPlayPage({
    Key key,
    @required this.courseId,
    @required this.lessonKey,
  }) : super(key: key);

  final int courseId;
  final String lessonKey;

  @override
  _LessonPlayPageState createState() => _LessonPlayPageState();
}

class _LessonPlayPageState extends State<LessonPlayPage> {
  final LessonPlayBloc lessonPlayBloc = LessonPlayBloc();

  @override
  void initState() {
    lessonPlayBloc.add(LessonPlayEventLoadData(
      widget.courseId,
      widget.lessonKey,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放页面'),
        backgroundColor: Color(0xFFFC9900),
      ),
      body: BlocProvider(
        create: (context) => lessonPlayBloc,
        child: Container(
          child: BlocBuilder<LessonPlayBloc, LessonPlayState>(
            buildWhen: (p, c) {
              return c != null;
            },
            builder: (context, state) {
              return CustomScrollView(
                slivers: _slivers(state),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _slivers(LessonPlayState state) {
    List<Widget> slivers = [];

    slivers.add(_playHeader(state));

    if (state.courseDetail != null) {
      Course course = Course(
        id: state.courseDetail.id,
        imgUrl: state.courseDetail.imgUrl,
        name: state.courseDetail.name,
        lessonsPlayedTime: state.courseDetail.lessonsPlayedTime,
        commentCount: state.courseDetail.commentCount,
        nowPrice: state.courseDetail.nowPrice,
        costPrice: state.courseDetail.costPrice,
        isShareCard: false,
      );

      slivers.add(_courseDetail(course));
    }

    if (state.lessons != null) {
      slivers.add(_sepLine());
      slivers.addAll(_lessonsList(state.lessons));
    }

    return slivers;
  }

  Widget _playHeader(LessonPlayState state) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: StickyTabBarDelegate(
        child: SizedBox(
          height: 300,
          width: 400,
          child: state?.lessonUrls?.tcplayer == null
              ? Container()
              : UiKitView(
                  viewType: 'FTxSuperplayer',
                  creationParams: <String, dynamic>{
                    'appId': state.lessonUrls.tcplayer.appId,
                    'fileId': state.lessonUrls.tcplayer.fileId ?? '',
                    'pSign': state.lessonUrls.tcplayer.psign ?? '',
                  },
                  creationParamsCodec: const StandardMessageCodec(),
                ),
          //     child: SuperPlayerView(
          //   controller: _playerController,
          // )
          //       child: IjkPlayer(
          //   mediaController: controller,
          // ),
        ),
      ),
    );
  }

  Widget _courseDetail(Course course) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: CourseCell(
          course: course,
        ),
      ),
    );
  }

  List<Widget> _lessonsList(List<CourseLesson> lessons) {
    List<Widget> _lessions = [];

    _lessions.add(SliverToBoxAdapter(
        child: SizedBox(
      height: 20,
    )));

    _lessions.addAll(lessons
        .map((CourseLesson lesson) => LessonList(
              lesson: lesson,
              courseId: widget.courseId,
              onTap: (Lesson lesson) {
                lessonPlayBloc.add(LessonPlayEventChangeLesson(
                  lesson.key,
                ));
              },
            ))
        .toList());

    return _lessions;
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
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
