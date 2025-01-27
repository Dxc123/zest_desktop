import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'my_user.freezed.dart';
part 'my_user.g.dart';
// /使用 json_serializable
// https://dartj.web.app/  json生成对应 model
/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build
/// dart run build_runner build --delete-conflicting-outputs

@freezed
class MyUser with _$MyUser {
  const factory MyUser({
    @JsonKey(name: 'login') String? login,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'node_id') String? nodeId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'gravatar_id') String? gravatarId,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'followers_url') String? followersUrl,
    @JsonKey(name: 'following_url') String? followingUrl,
    @JsonKey(name: 'gists_url') String? gistsUrl,
    @JsonKey(name: 'starred_url') String? starredUrl,
    @JsonKey(name: 'subscriptions_url') String? subscriptionsUrl,
    @JsonKey(name: 'organizations_url') String? organizationsUrl,
    @JsonKey(name: 'repos_url') String? reposUrl,
    @JsonKey(name: 'events_url') String? eventsUrl,
    @JsonKey(name: 'received_events_url') String? receivedEventsUrl,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'user_view_type') String? userViewType,
    @JsonKey(name: 'site_admin') bool? siteAdmin,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'company') String? company,
    @JsonKey(name: 'blog') String? blog,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'hireable') String? hireable,
    @JsonKey(name: 'bio') String? bio,
    @JsonKey(name: 'twitter_username') String? twitterUsername,
    @JsonKey(name: 'public_repos') int? publicRepos,
    @JsonKey(name: 'public_gists') int? publicGists,
    @JsonKey(name: 'followers') int? followers,
    @JsonKey(name: 'following') int? following,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, Object?> json) => _$MyUserFromJson(json);
}
