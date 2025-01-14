class PlaylistSuccessResponse {
  bool? success;
  String? message;
  Data? data;
  int? statusCode;

  PlaylistSuccessResponse(
      {this.success, this.message, this.data, this.statusCode});

  PlaylistSuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class Data {
  List<PlaylistDetails>? member;
  List<PlaylistDetails>? owner;

  Data({this.member, this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['member'] != null) {
      member = <PlaylistDetails>[];
      json['member'].forEach((v) {
        member!.add(PlaylistDetails.fromJson(v));
      });
    }
    if (json['owner'] != null) {
      owner = <PlaylistDetails>[];
      json['owner'].forEach((v) {
        owner!.add(PlaylistDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    if (owner != null) {
      data['owner'] = owner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlaylistDetails {
  String? userUuid;
  String? playlistUuid;
  String? playlistId;
  String? name;
  String? playlistCode;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? memberCount;

  PlaylistDetails(
      {this.userUuid,
      this.playlistUuid,
      this.playlistId,
      this.name,
      this.playlistCode,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.memberCount});

  PlaylistDetails.fromJson(Map<String, dynamic> json) {
    userUuid = json['user_uuid'];
    playlistUuid = json['playlist_uuid'];
    playlistId = json['playlist_id'];
    name = json['name'];
    playlistCode = json['playlist_code'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    memberCount = json['member_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_uuid'] = userUuid;
    data['playlist_uuid'] = playlistUuid;
    data['playlist_id'] = playlistId;
    data['name'] = name;
    data['playlist_code'] = playlistCode;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['member_count'] = memberCount;
    return data;
  }
}
