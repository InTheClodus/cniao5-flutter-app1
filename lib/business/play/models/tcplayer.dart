import 'package:equatable/equatable.dart';

class Tcplayer extends Equatable {
  final int appId;
  final String fileId;
  final String psign;

  const Tcplayer({this.appId, this.fileId, this.psign});

  factory Tcplayer.fromJson(Map<String, dynamic> json) => Tcplayer(
        appId: json['app_id'] as int,
        fileId: json['file_id'] as String,
        psign: json['psign'] as String,
      );

  Map<String, dynamic> toJson() => {
        'app_id': appId,
        'file_id': fileId,
        'psign': psign,
      };

  Tcplayer copyWith({
    String appId,
    String fileId,
    String psign,
  }) {
    return Tcplayer(
      appId: appId ?? this.appId,
      fileId: fileId ?? this.fileId,
      psign: psign ?? this.psign,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [appId, fileId, psign];
}
