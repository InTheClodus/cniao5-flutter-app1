import 'package:equatable/equatable.dart';

class Mp4 extends Equatable {
  final String hd;
  final String sd;
  final String shd;

  const Mp4({this.hd, this.sd, this.shd});

  factory Mp4.fromJson(Map<String, dynamic> json) => Mp4(
        hd: json['hd'] as String,
        sd: json['sd'] as String,
        shd: json['shd'] as String,
      );

  Map<String, dynamic> toJson() => {
        'hd': hd,
        'sd': sd,
        'shd': shd,
      };

  Mp4 copyWith({
    String hd,
    String sd,
    String shd,
  }) {
    return Mp4(
      hd: hd ?? this.hd,
      sd: sd ?? this.sd,
      shd: shd ?? this.shd,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [hd, sd, shd];
}
