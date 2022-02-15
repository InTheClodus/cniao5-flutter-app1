import 'package:equatable/equatable.dart';

class Hls extends Equatable {
  final String sd;
  final String hd;
  final String shd;

  const Hls({this.sd, this.hd, this.shd});

  factory Hls.fromJson(Map<String, dynamic> json) => Hls(
        sd: json['sd'] as String,
        hd: json['hd'] as String,
        shd: json['shd'] as String,
      );

  Map<String, dynamic> toJson() => {
        'sd': sd,
        'hd': hd,
        'shd': shd,
      };

  Hls copyWith({
    String sd,
    String hd,
    String shd,
  }) {
    return Hls(
      sd: sd ?? this.sd,
      hd: hd ?? this.hd,
      shd: shd ?? this.shd,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [sd, hd, shd];
}
