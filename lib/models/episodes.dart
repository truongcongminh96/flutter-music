class Episodes {
  String href;
  List<Items> items;
  int limit;
  String next;
  int offset;
  String previous;
  int total;

  Episodes(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Episodes.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class Items {
  String audioPreviewUrl;
  String description;
  int durationMs;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Images> images;
  bool isExternallyHosted;
  bool isPlayable;
  String language;
  List<String> languages;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  ResumePoint resumePoint;
  String type;
  String uri;

  Items(
      {this.audioPreviewUrl,
      this.description,
      this.durationMs,
      this.explicit,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.isPlayable,
      this.language,
      this.languages,
      this.name,
      this.releaseDate,
      this.releaseDatePrecision,
      this.resumePoint,
      this.type,
      this.uri});

  Items.fromJson(Map<String, dynamic> json) {
    audioPreviewUrl = json['audio_preview_url'];
    description = json['description'];
    durationMs = json['duration_ms'];
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
    isPlayable = json['is_playable'];
    language = json['language'];
    languages = json['languages'].cast<String>();
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    resumePoint = json['resume_point'] != null
        ? new ResumePoint.fromJson(json['resume_point'])
        : null;
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audio_preview_url'] = this.audioPreviewUrl;
    data['description'] = this.description;
    data['duration_ms'] = this.durationMs;
    data['explicit'] = this.explicit;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['is_externally_hosted'] = this.isExternallyHosted;
    data['is_playable'] = this.isPlayable;
    data['language'] = this.language;
    data['languages'] = this.languages;
    data['name'] = this.name;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    if (this.resumePoint != null) {
      data['resume_point'] = this.resumePoint.toJson();
    }
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class ExternalUrls {
  String spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class Images {
  int height;
  String url;
  int width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class ResumePoint {
  bool fullyPlayed;
  int resumePositionMs;

  ResumePoint({this.fullyPlayed, this.resumePositionMs});

  ResumePoint.fromJson(Map<String, dynamic> json) {
    fullyPlayed = json['fully_played'];
    resumePositionMs = json['resume_position_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fully_played'] = this.fullyPlayed;
    data['resume_position_ms'] = this.resumePositionMs;
    return data;
  }
}
