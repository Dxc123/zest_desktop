import 'dart:convert';

import '../../../generated/json/ap_banner_entity.g.dart';
import '../../../generated/json/base/json_field.dart';


@JsonSerializable()
class ApiBannerFatherEntity {

  ApiBannerFatherEntity();

  factory ApiBannerFatherEntity.fromJson(Map<String, dynamic> json) => $ApiBannerFatherEntityFromJson(json);
  List<ApiBannerEntity>? data;

  Map<String, dynamic> toJson() => $ApiBannerFatherEntityToJson(this);
}

@JsonSerializable()
class ApiBannerEntity {

  ApiBannerEntity();

  factory ApiBannerEntity.fromJson(Map<String, dynamic> json) => $ApiBannerEntityFromJson(json);
  late String desc;
  late int id;
  late String imagePath;
  late int isVisible;
  late int order;
  late String title;
  late int type;
  late String url;

  Map<String, dynamic> toJson() => $ApiBannerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
