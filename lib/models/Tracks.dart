import 'package:flutter_music/models/album.dart';
import 'package:flutter_music/models/artists.dart';
import 'package:flutter_music/models/external_ids.dart';
import 'package:flutter_music/models/external_urls.dart';

class AllTracks {
  List<AllTracks> allTracks;

  AllTracks({this.allTracks});

  AllTracks.fromJson(Map<String, dynamic> json) {
    if (json['tracks'] != null) {
      allTracks = new List<AllTracks>();
      json['tracks'].forEach((v) {
        allTracks.add(new AllTracks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allTracks != null) {
      data['tracks'] = this.allTracks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tracks {
  Album album;
  List<Artists> artists;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isLocal;
  bool isPlayable;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;

  Tracks(
      {this.album,
        this.artists,
        this.discNumber,
        this.durationMs,
        this.explicit,
        this.externalIds,
        this.externalUrls,
        this.href,
        this.id,
        this.isLocal,
        this.isPlayable,
        this.name,
        this.popularity,
        this.previewUrl,
        this.trackNumber,
        this.type,
        this.uri});

  Tracks.fromJson(Map<String, dynamic> json) {
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    discNumber = json['disc_number'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalIds = json['external_ids'] != null
        ? new ExternalIds.fromJson(json['external_ids'])
        : null;
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    isLocal = json['is_local'];
    isPlayable = json['is_playable'];
    name = json['name'];
    popularity = json['popularity'];
    previewUrl = json['preview_url'];
    trackNumber = json['track_number'];
    type = json['type'];
    uri = json['uri'];
  }
}
