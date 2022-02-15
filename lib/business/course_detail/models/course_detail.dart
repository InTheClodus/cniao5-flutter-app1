import 'package:equatable/equatable.dart';

import 'authority.dart';
import 'first_category.dart';
import 'teacher.dart';

class CourseDetail extends Equatable {
  final bool hasAuthority;
  final Authority authority;
  final String brief;
  final int canBuy;
  final int canUseCoupon;
  final int classDifficulty;
  final int commentCount;
  final double costPrice;
  final int courseType;
  final String createdTime;
  final String desc;
  final int expiryDay;
  final FirstCategory firstCategory;
  final dynamic fitTo;
  final dynamic goal;
  final dynamic h5site;
  final int id;
  final String imgUrl;
  final bool isDistribution;
  final int isFree;
  final int isLive;
  final bool isPt;
  final int lessonsCount;
  final int lessonsFinishedCount;
  final int lessonsPlayedTime;
  final int lessonsTime;
  final String name;
  final double nowPrice;
  final dynamic preTech;
  final String qrImgUrl;
  final int recommendCount;
  final dynamic subTitle;
  final Teacher teacher;
  final dynamic website;

  const CourseDetail({
    this.hasAuthority,
    this.authority,
    this.brief,
    this.canBuy,
    this.canUseCoupon,
    this.classDifficulty,
    this.commentCount,
    this.costPrice,
    this.courseType,
    this.createdTime,
    this.desc,
    this.expiryDay,
    this.firstCategory,
    this.fitTo,
    this.goal,
    this.h5site,
    this.id,
    this.imgUrl,
    this.isDistribution,
    this.isFree,
    this.isLive,
    this.isPt,
    this.lessonsCount,
    this.lessonsFinishedCount,
    this.lessonsPlayedTime,
    this.lessonsTime,
    this.name,
    this.nowPrice,
    this.preTech,
    this.qrImgUrl,
    this.recommendCount,
    this.subTitle,
    this.teacher,
    this.website,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
        hasAuthority: json['has_authority'] as bool,
        authority: json['authority'] == null
            ? null
            : Authority.fromJson(json['authority'] as Map<String, dynamic>),
        brief: json['brief'] as String,
        canBuy: json['can_buy'] as int,
        canUseCoupon: json['can_use_coupon'] as int,
        classDifficulty: json['class_difficulty'] as int,
        commentCount: json['comment_count'] as int,
        costPrice: json['cost_price'] as double,
        courseType: json['course_type'] as int,
        createdTime: json['created_time'] as String,
        desc: json['desc'] as String,
        expiryDay: json['expiry_day'] as int,
        firstCategory: json['first_category'] == null
            ? null
            : FirstCategory.fromJson(
                json['first_category'] as Map<String, dynamic>),
        fitTo: json['fit_to'],
        goal: json['goal'],
        h5site: json['h5site'],
        id: json['id'] as int,
        imgUrl: json['img_url'] as String,
        isDistribution: json['is_distribution'] as bool,
        isFree: json['is_free'] as int,
        isLive: json['is_live'] as int,
        isPt: json['is_pt'] as bool,
        lessonsCount: json['lessons_count'] as int,
        lessonsFinishedCount: json['lessons_finished_count'] as int,
        lessonsPlayedTime: json['lessons_played_time'] as int,
        lessonsTime: json['lessons_time'] as int,
        name: json['name'] as String,
        nowPrice: json['now_price'] as double,
        preTech: json['pre_tech'],
        qrImgUrl: json['qr_img_url'] as String,
        recommendCount: json['recommend_count'] as int,
        subTitle: json['sub_title'],
        teacher: json['teacher'] == null
            ? null
            : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
        website: json['website'],
      );

  Map<String, dynamic> toJson() => {
        'has_authority': hasAuthority,
        'authority': authority?.toJson(),
        'brief': brief,
        'can_buy': canBuy,
        'can_use_coupon': canUseCoupon,
        'class_difficulty': classDifficulty,
        'comment_count': commentCount,
        'cost_price': costPrice,
        'course_type': courseType,
        'created_time': createdTime,
        'desc': desc,
        'expiry_day': expiryDay,
        'first_category': firstCategory?.toJson(),
        'fit_to': fitTo,
        'goal': goal,
        'h5site': h5site,
        'id': id,
        'img_url': imgUrl,
        'is_distribution': isDistribution,
        'is_free': isFree,
        'is_live': isLive,
        'is_pt': isPt,
        'lessons_count': lessonsCount,
        'lessons_finished_count': lessonsFinishedCount,
        'lessons_played_time': lessonsPlayedTime,
        'lessons_time': lessonsTime,
        'name': name,
        'now_price': nowPrice,
        'pre_tech': preTech,
        'qr_img_url': qrImgUrl,
        'recommend_count': recommendCount,
        'sub_title': subTitle,
        'teacher': teacher?.toJson(),
        'website': website,
      };

  CourseDetail copyWith({
    bool hasAuthority,
    Authority authority,
    String brief,
    int canBuy,
    int canUseCoupon,
    int classDifficulty,
    int commentCount,
    double costPrice,
    int courseType,
    String createdTime,
    String desc,
    int expiryDay,
    FirstCategory firstCategory,
    dynamic fitTo,
    dynamic goal,
    dynamic h5site,
    int id,
    String imgUrl,
    bool isDistribution,
    int isFree,
    int isLive,
    bool isPt,
    int lessonsCount,
    int lessonsFinishedCount,
    int lessonsPlayedTime,
    int lessonsTime,
    String name,
    double nowPrice,
    dynamic preTech,
    String qrImgUrl,
    int recommendCount,
    dynamic subTitle,
    Teacher teacher,
    dynamic website,
  }) {
    return CourseDetail(
      hasAuthority: hasAuthority ?? this.hasAuthority,
      authority: authority ?? this.authority,
      brief: brief ?? this.brief,
      canBuy: canBuy ?? this.canBuy,
      canUseCoupon: canUseCoupon ?? this.canUseCoupon,
      classDifficulty: classDifficulty ?? this.classDifficulty,
      commentCount: commentCount ?? this.commentCount,
      costPrice: costPrice ?? this.costPrice,
      courseType: courseType ?? this.courseType,
      createdTime: createdTime ?? this.createdTime,
      desc: desc ?? this.desc,
      expiryDay: expiryDay ?? this.expiryDay,
      firstCategory: firstCategory ?? this.firstCategory,
      fitTo: fitTo ?? this.fitTo,
      goal: goal ?? this.goal,
      h5site: h5site ?? this.h5site,
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      isDistribution: isDistribution ?? this.isDistribution,
      isFree: isFree ?? this.isFree,
      isLive: isLive ?? this.isLive,
      isPt: isPt ?? this.isPt,
      lessonsCount: lessonsCount ?? this.lessonsCount,
      lessonsFinishedCount: lessonsFinishedCount ?? this.lessonsFinishedCount,
      lessonsPlayedTime: lessonsPlayedTime ?? this.lessonsPlayedTime,
      lessonsTime: lessonsTime ?? this.lessonsTime,
      name: name ?? this.name,
      nowPrice: nowPrice ?? this.nowPrice,
      preTech: preTech ?? this.preTech,
      qrImgUrl: qrImgUrl ?? this.qrImgUrl,
      recommendCount: recommendCount ?? this.recommendCount,
      subTitle: subTitle ?? this.subTitle,
      teacher: teacher ?? this.teacher,
      website: website ?? this.website,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      hasAuthority,
      authority,
      brief,
      canBuy,
      canUseCoupon,
      classDifficulty,
      commentCount,
      costPrice,
      courseType,
      createdTime,
      desc,
      expiryDay,
      firstCategory,
      fitTo,
      goal,
      h5site,
      id,
      imgUrl,
      isDistribution,
      isFree,
      isLive,
      isPt,
      lessonsCount,
      lessonsFinishedCount,
      lessonsPlayedTime,
      lessonsTime,
      name,
      nowPrice,
      preTech,
      qrImgUrl,
      recommendCount,
      subTitle,
      teacher,
      website,
    ];
  }
}
