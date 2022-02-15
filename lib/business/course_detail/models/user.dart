import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String logoUrl;
  final DateTime regTime;
  final String username;

  const User({this.id, this.logoUrl, this.regTime, this.username});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        logoUrl: json['logo_url'] as String,
        regTime: json['reg_time'] == null
            ? null
            : DateTime.parse(json['reg_time'] as String),
        username: json['username'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_url': logoUrl,
        'reg_time': regTime?.toIso8601String(),
        'username': username,
      };

  User copyWith({
    int id,
    String logoUrl,
    DateTime regTime,
    String username,
  }) {
    return User(
      id: id ?? this.id,
      logoUrl: logoUrl ?? this.logoUrl,
      regTime: regTime ?? this.regTime,
      username: username ?? this.username,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, logoUrl, regTime, username];
}
