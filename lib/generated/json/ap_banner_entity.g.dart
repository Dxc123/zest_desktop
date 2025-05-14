import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/models/ap_banner_entity.dart';

ApiBannerFatherEntity $ApiBannerFatherEntityFromJson(Map<String, dynamic> json) {
  final ApiBannerFatherEntity apiBannerFatherEntity = ApiBannerFatherEntity();
  final List<ApiBannerEntity>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<ApiBannerEntity>(e) as ApiBannerEntity).toList();
  if (data != null) {
    apiBannerFatherEntity.data = data;
  }
  return apiBannerFatherEntity;
}

Map<String, dynamic> $ApiBannerFatherEntityToJson(ApiBannerFatherEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension ApiBannerFatherEntityExtension on ApiBannerFatherEntity {
  ApiBannerFatherEntity copyWith({
    List<ApiBannerEntity>? data,
  }) {
    return ApiBannerFatherEntity()
      ..data = data ?? this.data;
  }
}

ApiBannerEntity $ApiBannerEntityFromJson(Map<String, dynamic> json) {
  final ApiBannerEntity apiBannerEntity = ApiBannerEntity();
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    apiBannerEntity.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    apiBannerEntity.id = id;
  }
  final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
  if (imagePath != null) {
    apiBannerEntity.imagePath = imagePath;
  }
  final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
  if (isVisible != null) {
    apiBannerEntity.isVisible = isVisible;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    apiBannerEntity.order = order;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    apiBannerEntity.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    apiBannerEntity.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    apiBannerEntity.url = url;
  }
  return apiBannerEntity;
}

Map<String, dynamic> $ApiBannerEntityToJson(ApiBannerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['imagePath'] = entity.imagePath;
  data['isVisible'] = entity.isVisible;
  data['order'] = entity.order;
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['url'] = entity.url;
  return data;
}

extension ApiBannerEntityExtension on ApiBannerEntity {
  ApiBannerEntity copyWith({
    String? desc,
    int? id,
    String? imagePath,
    int? isVisible,
    int? order,
    String? title,
    int? type,
    String? url,
  }) {
    return ApiBannerEntity()
      ..desc = desc ?? this.desc
      ..id = id ?? this.id
      ..imagePath = imagePath ?? this.imagePath
      ..isVisible = isVisible ?? this.isVisible
      ..order = order ?? this.order
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..url = url ?? this.url;
  }
}