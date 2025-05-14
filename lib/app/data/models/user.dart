import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
// /使用 json_serializable
// https://dartj.web.app/  json生成对应 model
/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build
/// dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class User {

  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  @JsonKey(name: 'login')
  String? login;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'node_id')
  String? nodeId;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'gravatar_id')
  String? gravatarId;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'followers_url')
  String? followersUrl;
  @JsonKey(name: 'following_url')
  String? followingUrl;
  @JsonKey(name: 'gists_url')
  String? gistsUrl;
  @JsonKey(name: 'starred_url')
  String? starredUrl;
  @JsonKey(name: 'subscriptions_url')
  String? subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  String? organizationsUrl;
  @JsonKey(name: 'repos_url')
  String? reposUrl;
  @JsonKey(name: 'events_url')
  String? eventsUrl;
  @JsonKey(name: 'received_events_url')
  String? receivedEventsUrl;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'user_view_type')
  String? userViewType;
  @JsonKey(name: 'site_admin')
  bool? siteAdmin;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'company')
  String? company;
  @JsonKey(name: 'blog')
  String? blog;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'hireable')
  String? hireable;
  @JsonKey(name: 'bio')
  String? bio;
  @JsonKey(name: 'twitter_username')
  String? twitterUsername;
  @JsonKey(name: 'public_repos')
  int? publicRepos;
  @JsonKey(name: 'public_gists')
  int? publicGists;
  @JsonKey(name: 'followers')
  int? followers;
  @JsonKey(name: 'following')
  int? following;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    String? userViewType,
    bool? siteAdmin,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    String? hireable,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gravatarId: gravatarId ?? this.gravatarId,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      userViewType: userViewType ?? this.userViewType,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      name: name ?? this.name,
      company: company ?? this.company,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      hireable: hireable ?? this.hireable,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
