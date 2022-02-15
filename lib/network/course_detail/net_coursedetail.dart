import 'package:cainiaowo/network/common/net_manager.dart';
import 'package:cainiaowo/network/course_detail/net_coursedetail_path.dart';

class CNWCourseDetailNetManager {
  // 课程详情
  static Future<Map> courseDetail({
    int courseId,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (courseId != null) queryParameters['course_id'] = courseId;

    Map map = await CNWNetManager.get<Map>(
      net_coursedetail_path_detail,
      queryParameters: queryParameters,
    );
    return map;
  }

  // 课程章节目录
  static Future<List> courseLessons({
    int courseId,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (courseId != null) queryParameters['course_id'] = courseId;

    List list = await CNWNetManager.get<List>(
      net_coursedetail_path_lessions,
      queryParameters: queryParameters,
    );
    return list;
  }

  // 课程评论列表
  static Future<Map> commentList({
    int courseId,
    int page = 1,
    int size = 20,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (courseId != null) queryParameters['course_id'] = courseId;
    if (page != null) queryParameters['page'] = page;
    if (size != null) queryParameters['size'] = size;

    Map map = await CNWNetManager.get<Map>(
      net_coursedetail_path_comments,
      queryParameters: queryParameters,
    );
    return map;
  }
}
