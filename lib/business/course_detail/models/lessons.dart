import 'package:equatable/equatable.dart';

import 'video_info.dart';

class Lesson extends Equatable {
  final int bsort;
  final int id;
  final bool isFinished;
  final int isFree;
  final int isLive;
  final String key;
  final dynamic livePlanBeginTime;
  final dynamic livePlanEndTime;
  final dynamic liveStatus;
  final String name;
  final int state;
  final VideoInfo videoInfo;

  const Lesson({
    this.bsort,
    this.id,
    this.isFinished,
    this.isFree,
    this.isLive,
    this.key,
    this.livePlanBeginTime,
    this.livePlanEndTime,
    this.liveStatus,
    this.name,
    this.state,
    this.videoInfo,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        bsort: json['bsort'] as int,
        id: json['id'] as int,
        isFinished: json['is_finished'] as bool,
        isFree: json['is_free'] as int,
        isLive: json['is_live'] as int,
        key: json['key'] as String,
        livePlanBeginTime: json['live_plan_begin_time'],
        livePlanEndTime: json['live_plan_end_time'],
        liveStatus: json['live_status'],
        name: json['name'] as String,
        state: json['state'] as int,
        videoInfo: json['video_info'] == null
            ? null
            : VideoInfo.fromJson(json['video_info'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'bsort': bsort,
        'id': id,
        'is_finished': isFinished,
        'is_free': isFree,
        'is_live': isLive,
        'key': key,
        'live_plan_begin_time': livePlanBeginTime,
        'live_plan_end_time': livePlanEndTime,
        'live_status': liveStatus,
        'name': name,
        'state': state,
        'video_info': videoInfo?.toJson(),
      };

  Lesson copyWith({
    int bsort,
    int id,
    bool isFinished,
    int isFree,
    int isLive,
    String key,
    dynamic livePlanBeginTime,
    dynamic livePlanEndTime,
    dynamic liveStatus,
    String name,
    int state,
    VideoInfo videoInfo,
  }) {
    return Lesson(
      bsort: bsort ?? this.bsort,
      id: id ?? this.id,
      isFinished: isFinished ?? this.isFinished,
      isFree: isFree ?? this.isFree,
      isLive: isLive ?? this.isLive,
      key: key ?? this.key,
      livePlanBeginTime: livePlanBeginTime ?? this.livePlanBeginTime,
      livePlanEndTime: livePlanEndTime ?? this.livePlanEndTime,
      liveStatus: liveStatus ?? this.liveStatus,
      name: name ?? this.name,
      state: state ?? this.state,
      videoInfo: videoInfo ?? this.videoInfo,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      bsort,
      id,
      isFinished,
      isFree,
      isLive,
      key,
      livePlanBeginTime,
      livePlanEndTime,
      liveStatus,
      name,
      state,
      videoInfo,
    ];
  }
}
