import 'package:flutter_music/models/external_urls.dart';
import 'package:flutter_music/models/images.dart';

class Shows {
  List<String> availableMarkets;
  List copyrights;
  String description;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Images> images;
  bool isExternallyHosted;
  List<String> languages;
  String mediaType;
  String name;
  String publisher;
  int totalEpisodes;
  String type;
  String uri;

  Shows(
      {this.availableMarkets,
        this.copyrights,
        this.description,
        this.explicit,
        this.externalUrls,
        this.href,
        this.id,
        this.images,
        this.isExternallyHosted,
        this.languages,
        this.mediaType,
        this.name,
        this.publisher,
        this.totalEpisodes,
        this.type,
        this.uri});

  Shows.fromJson(Map<String, dynamic> json) {
    availableMarkets = json['available_markets'].cast<String>();
    if (json['copyrights'] != null) {
      copyrights = new List<Null>();
      json['copyrights'].forEach((v) {
        copyrights.add(new Shows.fromJson(v));
      });
    }
    description = json['description'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    languages = json['languages'].cast<String>();
    mediaType = json['media_type'];
    name = json['name'];
    publisher = json['publisher'];
    totalEpisodes = json['total_episodes'];
    type = json['type'];
    uri = json['uri'];
  }
}

