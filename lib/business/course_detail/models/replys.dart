import 'package:equatable/equatable.dart';

import 'user.dart';

class Replys extends Equatable {
  final String createdTime;
  final int id;
  final String replyMsg;
  final User user;

  const Replys({this.createdTime, this.id, this.replyMsg, this.user});

  factory Replys.fromJson(Map<String, dynamic> json) => Replys(
        createdTime: json['created_time'] as String,
        id: json['id'] as int,
        replyMsg: json['reply_msg'] as String,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'created_time': createdTime,
        'id': id,
        'reply_msg': replyMsg,
        'user': user?.toJson(),
      };

  Replys copyWith({
    String createdTime,
    int id,
    String replyMsg,
    User user,
  }) {
    return Replys(
      createdTime: createdTime ?? this.createdTime,
      id: id ?? this.id,
      replyMsg: replyMsg ?? this.replyMsg,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [createdTime, id, replyMsg, user];
}
