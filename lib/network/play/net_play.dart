import 'package:cainiaowo/network/common/net_manager.dart';
import 'package:cainiaowo/network/play/net_play_path.dart';
import 'package:dio/dio.dart';

class CNWPlayNetManager {
  static Future<Map> lessonUrls(String lessonKey) async {
    if (lessonKey == null) {
      Response response = Response(
          statusCode: 404,
          data: {"errorCode": '-1', "errorMsg": 'lesson id can not be null.'});
      return response.data;
    }
    Map<String, dynamic> queryParameters = {
      'key': lessonKey,
    };
    Map resData = await CNWNetManager.get<Map>(
      net_play_urls,
      queryParameters: queryParameters,
    );
    return resData;
  }
}
