import 'package:zest_desktop/generated/json/base/json_convert_content.dart';
import 'package:zest_desktop/app/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';


User $UserFromJson(Map<String, dynamic> json) {
  final User user = User();
  final String? login = jsonConvert.convert<String>(json['login']);
  if (login != null) {
    user.login = login;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    user.id = id;
  }
  final String? nodeId = jsonConvert.convert<String>(json['nodeId']);
  if (nodeId != null) {
    user.nodeId = nodeId;
  }
  final String? avatarUrl = jsonConvert.convert<String>(json['avatarUrl']);
  if (avatarUrl != null) {
    user.avatarUrl = avatarUrl;
  }
  final String? gravatarId = jsonConvert.convert<String>(json['gravatarId']);
  if (gravatarId != null) {
    user.gravatarId = gravatarId;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    user.url = url;
  }
  final String? htmlUrl = jsonConvert.convert<String>(json['htmlUrl']);
  if (htmlUrl != null) {
    user.htmlUrl = htmlUrl;
  }
  final String? followersUrl = jsonConvert.convert<String>(json['followersUrl']);
  if (followersUrl != null) {
    user.followersUrl = followersUrl;
  }
  final String? followingUrl = jsonConvert.convert<String>(json['followingUrl']);
  if (followingUrl != null) {
    user.followingUrl = followingUrl;
  }
  final String? gistsUrl = jsonConvert.convert<String>(json['gistsUrl']);
  if (gistsUrl != null) {
    user.gistsUrl = gistsUrl;
  }
  final String? starredUrl = jsonConvert.convert<String>(json['starredUrl']);
  if (starredUrl != null) {
    user.starredUrl = starredUrl;
  }
  final String? subscriptionsUrl = jsonConvert.convert<String>(json['subscriptionsUrl']);
  if (subscriptionsUrl != null) {
    user.subscriptionsUrl = subscriptionsUrl;
  }
  final String? organizationsUrl = jsonConvert.convert<String>(json['organizationsUrl']);
  if (organizationsUrl != null) {
    user.organizationsUrl = organizationsUrl;
  }
  final String? reposUrl = jsonConvert.convert<String>(json['reposUrl']);
  if (reposUrl != null) {
    user.reposUrl = reposUrl;
  }
  final String? eventsUrl = jsonConvert.convert<String>(json['eventsUrl']);
  if (eventsUrl != null) {
    user.eventsUrl = eventsUrl;
  }
  final String? receivedEventsUrl = jsonConvert.convert<String>(json['receivedEventsUrl']);
  if (receivedEventsUrl != null) {
    user.receivedEventsUrl = receivedEventsUrl;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    user.type = type;
  }
  final String? userViewType = jsonConvert.convert<String>(json['userViewType']);
  if (userViewType != null) {
    user.userViewType = userViewType;
  }
  final bool? siteAdmin = jsonConvert.convert<bool>(json['siteAdmin']);
  if (siteAdmin != null) {
    user.siteAdmin = siteAdmin;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    user.name = name;
  }
  final String? company = jsonConvert.convert<String>(json['company']);
  if (company != null) {
    user.company = company;
  }
  final String? blog = jsonConvert.convert<String>(json['blog']);
  if (blog != null) {
    user.blog = blog;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    user.location = location;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    user.email = email;
  }
  final String? hireable = jsonConvert.convert<String>(json['hireable']);
  if (hireable != null) {
    user.hireable = hireable;
  }
  final String? bio = jsonConvert.convert<String>(json['bio']);
  if (bio != null) {
    user.bio = bio;
  }
  final String? twitterUsername = jsonConvert.convert<String>(json['twitterUsername']);
  if (twitterUsername != null) {
    user.twitterUsername = twitterUsername;
  }
  final int? publicRepos = jsonConvert.convert<int>(json['publicRepos']);
  if (publicRepos != null) {
    user.publicRepos = publicRepos;
  }
  final int? publicGists = jsonConvert.convert<int>(json['publicGists']);
  if (publicGists != null) {
    user.publicGists = publicGists;
  }
  final int? followers = jsonConvert.convert<int>(json['followers']);
  if (followers != null) {
    user.followers = followers;
  }
  final int? following = jsonConvert.convert<int>(json['following']);
  if (following != null) {
    user.following = following;
  }
  final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
  if (createdAt != null) {
    user.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
  if (updatedAt != null) {
    user.updatedAt = updatedAt;
  }
  return user;
}

Map<String, dynamic> $UserToJson(User entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['login'] = entity.login;
  data['id'] = entity.id;
  data['nodeId'] = entity.nodeId;
  data['avatarUrl'] = entity.avatarUrl;
  data['gravatarId'] = entity.gravatarId;
  data['url'] = entity.url;
  data['htmlUrl'] = entity.htmlUrl;
  data['followersUrl'] = entity.followersUrl;
  data['followingUrl'] = entity.followingUrl;
  data['gistsUrl'] = entity.gistsUrl;
  data['starredUrl'] = entity.starredUrl;
  data['subscriptionsUrl'] = entity.subscriptionsUrl;
  data['organizationsUrl'] = entity.organizationsUrl;
  data['reposUrl'] = entity.reposUrl;
  data['eventsUrl'] = entity.eventsUrl;
  data['receivedEventsUrl'] = entity.receivedEventsUrl;
  data['type'] = entity.type;
  data['userViewType'] = entity.userViewType;
  data['siteAdmin'] = entity.siteAdmin;
  data['name'] = entity.name;
  data['company'] = entity.company;
  data['blog'] = entity.blog;
  data['location'] = entity.location;
  data['email'] = entity.email;
  data['hireable'] = entity.hireable;
  data['bio'] = entity.bio;
  data['twitterUsername'] = entity.twitterUsername;
  data['publicRepos'] = entity.publicRepos;
  data['publicGists'] = entity.publicGists;
  data['followers'] = entity.followers;
  data['following'] = entity.following;
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  return data;
}

extension UserExtension on User {
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
    return User()
      ..login = login ?? this.login
      ..id = id ?? this.id
      ..nodeId = nodeId ?? this.nodeId
      ..avatarUrl = avatarUrl ?? this.avatarUrl
      ..gravatarId = gravatarId ?? this.gravatarId
      ..url = url ?? this.url
      ..htmlUrl = htmlUrl ?? this.htmlUrl
      ..followersUrl = followersUrl ?? this.followersUrl
      ..followingUrl = followingUrl ?? this.followingUrl
      ..gistsUrl = gistsUrl ?? this.gistsUrl
      ..starredUrl = starredUrl ?? this.starredUrl
      ..subscriptionsUrl = subscriptionsUrl ?? this.subscriptionsUrl
      ..organizationsUrl = organizationsUrl ?? this.organizationsUrl
      ..reposUrl = reposUrl ?? this.reposUrl
      ..eventsUrl = eventsUrl ?? this.eventsUrl
      ..receivedEventsUrl = receivedEventsUrl ?? this.receivedEventsUrl
      ..type = type ?? this.type
      ..userViewType = userViewType ?? this.userViewType
      ..siteAdmin = siteAdmin ?? this.siteAdmin
      ..name = name ?? this.name
      ..company = company ?? this.company
      ..blog = blog ?? this.blog
      ..location = location ?? this.location
      ..email = email ?? this.email
      ..hireable = hireable ?? this.hireable
      ..bio = bio ?? this.bio
      ..twitterUsername = twitterUsername ?? this.twitterUsername
      ..publicRepos = publicRepos ?? this.publicRepos
      ..publicGists = publicGists ?? this.publicGists
      ..followers = followers ?? this.followers
      ..following = following ?? this.following
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}