import 'package:equatable/equatable.dart';

import 'replys.dart';
import 'user.dart';

class CourseComment extends Equatable {
  final String comment;
  final String createdTime;
  final int id;
  final int isEssence;
  final List<Replys> replys;
  final int resId;
  final int resType;
  final int score;
  final User user;

  const CourseComment({
    this.comment,
    this.createdTime,
    this.id,
    this.isEssence,
    this.replys,
    this.resId,
    this.resType,
    this.score,
    this.user,
  });

  factory CourseComment.fromJson(Map<String, dynamic> json) => CourseComment(
        comment: json['comment'] as String,
        createdTime: json['created_time'] as String,
        id: json['id'] as int,
        isEssence: json['is_essence'] as int,
        replys: (json['replys'] as List<dynamic>)
            ?.map((e) =>
                e == null ? null : Replys.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        resId: json['res_id'] as int,
        resType: json['res_type'] as int,
        score: json['score'] as int,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'comment': comment,
        'created_time': createdTime,
        'id': id,
        'is_essence': isEssence,
        'replys': replys?.map((e) => e?.toJson())?.toList(),
        'res_id': resId,
        'res_type': resType,
        'score': score,
        'user': user?.toJson(),
      };

  CourseComment copyWith({
    String comment,
    String createdTime,
    int id,
    int isEssence,
    List<Replys> replys,
    int resId,
    int resType,
    int score,
    User user,
  }) {
    return CourseComment(
      comment: comment ?? this.comment,
      createdTime: createdTime ?? this.createdTime,
      id: id ?? this.id,
      isEssence: isEssence ?? this.isEssence,
      replys: replys ?? this.replys,
      resId: resId ?? this.resId,
      resType: resType ?? this.resType,
      score: score ?? this.score,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      comment,
      createdTime,
      id,
      isEssence,
      replys,
      resId,
      resType,
      score,
      user,
    ];
  }
}
