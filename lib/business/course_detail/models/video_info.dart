import 'package:equatable/equatable.dart';

class VideoInfo extends Equatable {
  final int duration;
  final int id;

  const VideoInfo({this.duration, this.id});

  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
        duration: json['duration'] as int,
        id: json['id'] as int,
      );

  Map<String, dynamic> toJson() => {
        'duration': duration,
        'id': id,
      };

  VideoInfo copyWith({
    int duration,
    int id,
  }) {
    return VideoInfo(
      duration: duration ?? this.duration,
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [duration, id];
}
