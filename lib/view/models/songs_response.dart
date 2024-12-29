import 'dart:convert';

class SongsResponse {
  bool? success;
  String? message;
  Data? data;
  int? statusCode;

  SongsResponse({
    this.success,
    this.message,
    this.data,
    this.statusCode,
  });

  factory SongsResponse.fromRawJson(String str) =>
      SongsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SongsResponse.fromJson(Map<String, dynamic> json) => SongsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "status_code": statusCode,
      };

  SongsResponse copyWith({
    bool? success,
    String? message,
    Data? data,
    int? statusCode,
  }) {
    return SongsResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

class Data {
  List<Accepted>? accepted;
  List<Submitted>? submitted;

  Data({
    this.accepted,
    this.submitted,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accepted: json["accepted"] == null
            ? []
            : List<Accepted>.from(
                json["accepted"]!.map((x) => Accepted.fromJson(x))),
        submitted: json["submitted"] == null
            ? []
            : List<Submitted>.from(
                json["submitted"]!.map((x) => Submitted.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accepted": accepted == null
            ? []
            : List<dynamic>.from(accepted!.map((x) => x.toJson())),
        "submitted": submitted == null
            ? []
            : List<dynamic>.from(submitted!.map((x) => x.toJson())),
      };
}

class Accepted {
  DateTime? addedAt;
  AddedBy? addedBy;
  bool? isLocal;
  Track? track;

  Accepted({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.track,
  });

  factory Accepted.fromRawJson(String str) =>
      Accepted.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Accepted.fromJson(Map<String, dynamic> json) => Accepted(
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        addedBy: json["added_by"] == null
            ? null
            : AddedBy.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "added_at": addedAt?.toIso8601String(),
        "added_by": addedBy?.toJson(),
        "is_local": isLocal,
        "track": track?.toJson(),
      };
}

class AddedBy {
  String? displayName;
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  dynamic images;
  String? uri;

  AddedBy({
    this.displayName,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.uri,
  });

  factory AddedBy.fromRawJson(String str) => AddedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        displayName: json["display_name"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        images: json["images"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "href": href,
        "id": id,
        "images": images,
        "uri": uri,
      };
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromRawJson(String str) =>
      ExternalUrls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Followers {
  int? total;
  String? href;

  Followers({
    this.total,
    this.href,
  });

  factory Followers.fromRawJson(String str) =>
      Followers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        total: json["total"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "href": href,
      };
}

class Track {
  Submitted? track;
  dynamic episode;

  Track({
    this.track,
    this.episode,
  });

  factory Track.fromRawJson(String str) => Track.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        track: json["Track"] == null ? null : Submitted.fromJson(json["Track"]),
        episode: json["Episode"],
      );

  Map<String, dynamic> toJson() => {
        "Track": track?.toJson(),
        "Episode": episode,
      };
}

class Submitted {
  List<Artist>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? previewUrl;
  int? trackNumber;
  String? uri;
  String? type;
  Album? album;
  ExternalIds? externalIds;
  int? popularity;
  dynamic isPlayable;
  dynamic linkedFrom;

  Submitted({
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.uri,
    this.type,
    this.album,
    this.externalIds,
    this.popularity,
    this.isPlayable,
    this.linkedFrom,
  });

  factory Submitted.fromRawJson(String str) =>
      Submitted.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Submitted.fromJson(Map<String, dynamic> json) => Submitted(
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        uri: json["uri"],
        type: json["type"],
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        popularity: json["popularity"],
        isPlayable: json["is_playable"],
        linkedFrom: json["linked_from"],
      );

  Map<String, dynamic> toJson() => {
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "uri": uri,
        "type": type,
        "album": album?.toJson(),
        "external_ids": externalIds?.toJson(),
        "popularity": popularity,
        "is_playable": isPlayable,
        "linked_from": linkedFrom,
      };
}

class Album {
  String? name;
  List<Artist>? artists;
  String? albumGroup;
  String? albumType;
  String? id;
  String? uri;
  List<String>? availableMarkets;
  String? href;
  List<Image>? images;
  ExternalUrls? externalUrls;
  DateTime? releaseDate;
  String? releaseDatePrecision;

  Album({
    this.name,
    this.artists,
    this.albumGroup,
    this.albumType,
    this.id,
    this.uri,
    this.availableMarkets,
    this.href,
    this.images,
    this.externalUrls,
    this.releaseDate,
    this.releaseDatePrecision,
  });

  factory Album.fromRawJson(String str) => Album.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        albumGroup: json["album_group"],
        albumType: json["album_type"],
        id: json["id"],
        uri: json["uri"],
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        href: json["href"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "album_group": albumGroup,
        "album_type": albumType,
        "id": id,
        "uri": uri,
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "href": href,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "external_urls": externalUrls?.toJson(),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
      };
}

class Artist {
  String? name;
  String? id;
  String? uri;
  String? href;
  ExternalUrls? externalUrls;

  Artist({
    this.name,
    this.id,
    this.uri,
    this.href,
    this.externalUrls,
  });

  factory Artist.fromRawJson(String str) => Artist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        id: json["id"],
        uri: json["uri"],
        href: json["href"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "uri": uri,
        "href": href,
        "external_urls": externalUrls?.toJson(),
      };
}

class Image {
  int? height;
  int? width;
  String? url;

  Image({
    this.height,
    this.width,
    this.url,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        width: json["width"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "url": url,
      };
}

class ExternalIds {
  String? isrc;

  ExternalIds({
    this.isrc,
  });

  factory ExternalIds.fromRawJson(String str) =>
      ExternalIds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}
