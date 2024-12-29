class PlaylistSuccessResponse {
  bool? success;
  String? message;
  List<Data>? data;
  int? statusCode;

  PlaylistSuccessResponse(
      {this.success, this.message, this.data, this.statusCode});

  PlaylistSuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class Data {
  String? userUuid;
  String? playlistUuid;
  String? playlistId;
  String? name;
  String? playlistCode;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.userUuid,
      this.playlistUuid,
      this.playlistId,
      this.name,
      this.playlistCode,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userUuid = json['user_uuid'];
    playlistUuid = json['playlist_uuid'];
    playlistId = json['playlist_id'];
    name = json['name'];
    playlistCode = json['playlist_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_uuid'] = userUuid;
    data['playlist_uuid'] = playlistUuid;
    data['playlist_id'] = playlistId;
    data['name'] = name;
    data['playlist_code'] = playlistCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
