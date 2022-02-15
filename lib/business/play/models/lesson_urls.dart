import 'package:equatable/equatable.dart';

import 'tcplayer.dart';
import 'urls.dart';

class LessonUrls extends Equatable {
  final int status;
  final int experDuration;
  final bool isExper;
  final bool isLogin;
  final int videoSource;
  final int seek;
  final int isLive;
  final Tcplayer tcplayer;
  final Urls urls;

  const LessonUrls({
    this.status,
    this.experDuration,
    this.isExper,
    this.isLogin,
    this.videoSource,
    this.seek,
    this.isLive,
    this.tcplayer,
    this.urls,
  });

  factory LessonUrls.fromJson(Map<String, dynamic> json) => LessonUrls(
        status: json['status'] as int,
        experDuration: json['exper_duration'] as int,
        isExper: json['is_exper'] as bool,
        isLogin: json['is_login'] as bool,
        videoSource: json['video_source'] as int,
        seek: json['seek'] as int,
        isLive: json['is_live'] as int,
        tcplayer: json['tcplayer'] == null
            ? null
            : Tcplayer.fromJson(json['tcplayer'] as Map<String, dynamic>),
        urls: json['urls'] == null
            ? null
            : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'exper_duration': experDuration,
        'is_exper': isExper,
        'is_login': isLogin,
        'video_source': videoSource,
        'seek': seek,
        'is_live': isLive,
        'tcplayer': tcplayer?.toJson(),
        'urls': urls?.toJson(),
      };

  LessonUrls copyWith({
    int status,
    int experDuration,
    bool isExper,
    bool isLogin,
    int videoSource,
    int seek,
    int isLive,
    Tcplayer tcplayer,
    Urls urls,
  }) {
    return LessonUrls(
      status: status ?? this.status,
      experDuration: experDuration ?? this.experDuration,
      isExper: isExper ?? this.isExper,
      isLogin: isLogin ?? this.isLogin,
      videoSource: videoSource ?? this.videoSource,
      seek: seek ?? this.seek,
      isLive: isLive ?? this.isLive,
      tcplayer: tcplayer ?? this.tcplayer,
      urls: urls ?? this.urls,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      status,
      experDuration,
      isExper,
      isLogin,
      videoSource,
      seek,
      isLive,
      tcplayer,
      urls,
    ];
  }
}
