import 'package:equatable/equatable.dart';

import 'hls.dart';
import 'mp4.dart';

class Urls extends Equatable {
  final Hls hls;
  final Mp4 mp4;
  final String orig;

  const Urls({this.hls, this.mp4, this.orig});

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        hls: json['hls'] == null
            ? null
            : Hls.fromJson(json['hls'] as Map<String, dynamic>),
        mp4: json['mp4'] == null
            ? null
            : Mp4.fromJson(json['mp4'] as Map<String, dynamic>),
        orig: json['orig'] as String,
      );

  Map<String, dynamic> toJson() => {
        'hls': hls?.toJson(),
        'mp4': mp4?.toJson(),
        'orig': orig,
      };

  Urls copyWith({
    Hls hls,
    Mp4 mp4,
    String orig,
  }) {
    return Urls(
      hls: hls ?? this.hls,
      mp4: mp4 ?? this.mp4,
      orig: orig ?? this.orig,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [hls, mp4, orig];
}
