
class SongModel {
    String? addedAt;
    AddedBy? addedBy;
    bool? isLocal;
    dynamic primaryColor;
    Track? track;
    VideoThumbnail? videoThumbnail;

    SongModel({this.addedAt, this.addedBy, this.isLocal, this.primaryColor, this.track, this.videoThumbnail});

    SongModel.fromJson(Map<String, dynamic> json) {
        if(json["added_at"] is String) {
            addedAt = json["added_at"];
        }
        if(json["added_by"] is Map) {
            addedBy = json["added_by"] == null ? null : AddedBy.fromJson(json["added_by"]);
        }
        if(json["is_local"] is bool) {
            isLocal = json["is_local"];
        }
        primaryColor = json["primary_color"];
        if(json["track"] is Map) {
            track = json["track"] == null ? null : Track.fromJson(json["track"]);
        }
        if(json["video_thumbnail"] is Map) {
            videoThumbnail = json["video_thumbnail"] == null ? null : VideoThumbnail.fromJson(json["video_thumbnail"]);
        }
    }

    static List<SongModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => SongModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["added_at"] = addedAt;
        if(addedBy != null) {
            _data["added_by"] = addedBy?.toJson();
        }
        _data["is_local"] = isLocal;
        _data["primary_color"] = primaryColor;
        if(track != null) {
            _data["track"] = track?.toJson();
        }
        if(videoThumbnail != null) {
            _data["video_thumbnail"] = videoThumbnail?.toJson();
        }
        return _data;
    }

    SongModel copyWith({
        String? addedAt,
        AddedBy? addedBy,
        bool? isLocal,
        dynamic primaryColor,
        Track? track,
        VideoThumbnail? videoThumbnail,
    }) => SongModel(
        addedAt: addedAt ?? this.addedAt,
        addedBy: addedBy ?? this.addedBy,
        isLocal: isLocal ?? this.isLocal,
        primaryColor: primaryColor ?? this.primaryColor,
        track: track ?? this.track,
        videoThumbnail: videoThumbnail ?? this.videoThumbnail,
    );
}

class VideoThumbnail {
    dynamic url;

    VideoThumbnail({this.url});

    VideoThumbnail.fromJson(Map<String, dynamic> json) {
        url = json["url"];
    }

    static List<VideoThumbnail> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => VideoThumbnail.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        return _data;
    }

    VideoThumbnail copyWith({
        dynamic url,
    }) => VideoThumbnail(
        url: url ?? this.url,
    );
}

class Track {
    String? previewUrl;
    List<String>? availableMarkets;
    bool? explicit;
    String? type;
    bool? episode;
    bool? track;
    Album? album;
    List<Artists1>? artists;
    int? discNumber;
    int? trackNumber;
    int? durationMs;
    ExternalIds? externalIds;
    ExternalUrls4? externalUrls;
    String? href;
    String? id;
    String? name;
    int? popularity;
    String? uri;
    bool? isLocal;

    Track({this.previewUrl, this.availableMarkets, this.explicit, this.type, this.episode, this.track, this.album, this.artists, this.discNumber, this.trackNumber, this.durationMs, this.externalIds, this.externalUrls, this.href, this.id, this.name, this.popularity, this.uri, this.isLocal, required imageUrl});

    Track.fromJson(Map<String, dynamic> json) {
        if(json["preview_url"] is String) {
            previewUrl = json["preview_url"];
        }
        if(json["available_markets"] is List) {
            availableMarkets = json["available_markets"] == null ? null : List<String>.from(json["available_markets"]);
        }
        if(json["explicit"] is bool) {
            explicit = json["explicit"];
        }
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["episode"] is bool) {
            episode = json["episode"];
        }
        if(json["track"] is bool) {
            track = json["track"];
        }
        if(json["album"] is Map) {
            album = json["album"] == null ? null : Album.fromJson(json["album"]);
        }
        if(json["artists"] is List) {
            artists = json["artists"] == null ? null : (json["artists"] as List).map((e) => Artists1.fromJson(e)).toList();
        }
        if(json["disc_number"] is int) {
            discNumber = json["disc_number"];
        }
        if(json["track_number"] is int) {
            trackNumber = json["track_number"];
        }
        if(json["duration_ms"] is int) {
            durationMs = json["duration_ms"];
        }
        if(json["external_ids"] is Map) {
            externalIds = json["external_ids"] == null ? null : ExternalIds.fromJson(json["external_ids"]);
        }
        if(json["external_urls"] is Map) {
            externalUrls = json["external_urls"] == null ? null : ExternalUrls4.fromJson(json["external_urls"]);
        }
        if(json["href"] is String) {
            href = json["href"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["popularity"] is int) {
            popularity = json["popularity"];
        }
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["is_local"] is bool) {
            isLocal = json["is_local"];
        }
    }

    static List<Track> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Track.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["preview_url"] = previewUrl;
        if(availableMarkets != null) {
            _data["available_markets"] = availableMarkets;
        }
        _data["explicit"] = explicit;
        _data["type"] = type;
        _data["episode"] = episode;
        _data["track"] = track;
        if(album != null) {
            _data["album"] = album?.toJson();
        }
        if(artists != null) {
            _data["artists"] = artists?.map((e) => e.toJson()).toList();
        }
        _data["disc_number"] = discNumber;
        _data["track_number"] = trackNumber;
        _data["duration_ms"] = durationMs;
        if(externalIds != null) {
            _data["external_ids"] = externalIds?.toJson();
        }
        if(externalUrls != null) {
            _data["external_urls"] = externalUrls?.toJson();
        }
        _data["href"] = href;
        _data["id"] = id;
        _data["name"] = name;
        _data["popularity"] = popularity;
        _data["uri"] = uri;
        _data["is_local"] = isLocal;
        return _data;
    }

    Track copyWith({
        String? previewUrl,
        List<String>? availableMarkets,
        bool? explicit,
        String? type,
        bool? episode,
        bool? track,
        Album? album,
        List<Artists1>? artists,
        int? discNumber,
        int? trackNumber,
        int? durationMs,
        ExternalIds? externalIds,
        ExternalUrls4? externalUrls,
        String? href,
        String? id,
        String? name,
        int? popularity,
        String? uri,
        bool? isLocal,
    }) => Track(
        previewUrl: previewUrl ?? this.previewUrl,
        availableMarkets: availableMarkets ?? this.availableMarkets,
        explicit: explicit ?? this.explicit,
        type: type ?? this.type,
        episode: episode ?? this.episode,
        track: track ?? this.track,
        album: album ?? this.album,
        artists: artists ?? this.artists,
        discNumber: discNumber ?? this.discNumber,
        trackNumber: trackNumber ?? this.trackNumber,
        durationMs: durationMs ?? this.durationMs,
        externalIds: externalIds ?? this.externalIds,
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        name: name ?? this.name,
        popularity: popularity ?? this.popularity,
        uri: uri ?? this.uri,
        isLocal: isLocal ?? this.isLocal, imageUrl: null,
    );
}

class ExternalUrls4 {
    String? spotify;

    ExternalUrls4({this.spotify});

    ExternalUrls4.fromJson(Map<String, dynamic> json) {
        if(json["spotify"] is String) {
            spotify = json["spotify"];
        }
    }

    static List<ExternalUrls4> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ExternalUrls4.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["spotify"] = spotify;
        return _data;
    }

    ExternalUrls4 copyWith({
        String? spotify,
    }) => ExternalUrls4(
        spotify: spotify ?? this.spotify,
    );
}

class ExternalIds {
    String? isrc;

    ExternalIds({this.isrc});

    ExternalIds.fromJson(Map<String, dynamic> json) {
        if(json["isrc"] is String) {
            isrc = json["isrc"];
        }
    }

    static List<ExternalIds> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ExternalIds.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["isrc"] = isrc;
        return _data;
    }

    ExternalIds copyWith({
        String? isrc,
    }) => ExternalIds(
        isrc: isrc ?? this.isrc,
    );
}

class Artists1 {
    ExternalUrls3? externalUrls;
    String? href;
    String? id;
    String? name;
    String? type;
    String? uri;

    Artists1({this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

    Artists1.fromJson(Map<String, dynamic> json) {
        if(json["external_urls"] is Map) {
            externalUrls = json["external_urls"] == null ? null : ExternalUrls3.fromJson(json["external_urls"]);
        }
        if(json["href"] is String) {
            href = json["href"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["uri"] is String) {
            uri = json["uri"];
        }
    }

    static List<Artists1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Artists1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(externalUrls != null) {
            _data["external_urls"] = externalUrls?.toJson();
        }
        _data["href"] = href;
        _data["id"] = id;
        _data["name"] = name;
        _data["type"] = type;
        _data["uri"] = uri;
        return _data;
    }

    Artists1 copyWith({
        ExternalUrls3? externalUrls,
        String? href,
        String? id,
        String? name,
        String? type,
        String? uri,
    }) => Artists1(
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        uri: uri ?? this.uri,
    );
}

class ExternalUrls3 {
    String? spotify;

    ExternalUrls3({this.spotify});

    ExternalUrls3.fromJson(Map<String, dynamic> json) {
        if(json["spotify"] is String) {
            spotify = json["spotify"];
        }
    }

    static List<ExternalUrls3> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ExternalUrls3.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["spotify"] = spotify;
        return _data;
    }

    ExternalUrls3 copyWith({
        String? spotify,
    }) => ExternalUrls3(
        spotify: spotify ?? this.spotify,
    );
}

class Album {
    List<String>? availableMarkets;
    String? type;
    String? albumType;
    String? href;
    String? id;
    List<Images>? images;
    String? name;
    String? releaseDate;
    String? releaseDatePrecision;
    String? uri;
    List<Artists>? artists;
    ExternalUrls2? externalUrls;
    int? totalTracks;

    Album({this.availableMarkets, this.type, this.albumType, this.href, this.id, this.images, this.name, this.releaseDate, this.releaseDatePrecision, this.uri, this.artists, this.externalUrls, this.totalTracks});

    Album.fromJson(Map<String, dynamic> json) {
        if(json["available_markets"] is List) {
            availableMarkets = json["available_markets"] == null ? null : List<String>.from(json["available_markets"]);
        }
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["album_type"] is String) {
            albumType = json["album_type"];
        }
        if(json["href"] is String) {
            href = json["href"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["images"] is List) {
            images = json["images"] == null ? null : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["release_date"] is String) {
            releaseDate = json["release_date"];
        }
        if(json["release_date_precision"] is String) {
            releaseDatePrecision = json["release_date_precision"];
        }
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["artists"] is List) {
            artists = json["artists"] == null ? null : (json["artists"] as List).map((e) => Artists.fromJson(e)).toList();
        }
        if(json["external_urls"] is Map) {
            externalUrls = json["external_urls"] == null ? null : ExternalUrls2.fromJson(json["external_urls"]);
        }
        if(json["total_tracks"] is int) {
            totalTracks = json["total_tracks"];
        }
    }

    static List<Album> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Album.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(availableMarkets != null) {
            _data["available_markets"] = availableMarkets;
        }
        _data["type"] = type;
        _data["album_type"] = albumType;
        _data["href"] = href;
        _data["id"] = id;
        if(images != null) {
            _data["images"] = images?.map((e) => e.toJson()).toList();
        }
        _data["name"] = name;
        _data["release_date"] = releaseDate;
        _data["release_date_precision"] = releaseDatePrecision;
        _data["uri"] = uri;
        if(artists != null) {
            _data["artists"] = artists?.map((e) => e.toJson()).toList();
        }
        if(externalUrls != null) {
            _data["external_urls"] = externalUrls?.toJson();
        }
        _data["total_tracks"] = totalTracks;
        return _data;
    }

    Album copyWith({
        List<String>? availableMarkets,
        String? type,
        String? albumType,
        String? href,
        String? id,
        List<Images>? images,
        String? name,
        String? releaseDate,
        String? releaseDatePrecision,
        String? uri,
        List<Artists>? artists,
        ExternalUrls2? externalUrls,
        int? totalTracks,
    }) => Album(
        availableMarkets: availableMarkets ?? this.availableMarkets,
        type: type ?? this.type,
        albumType: albumType ?? this.albumType,
        href: href ?? this.href,
        id: id ?? this.id,
        images: images ?? this.images,
        name: name ?? this.name,
        releaseDate: releaseDate ?? this.releaseDate,
        releaseDatePrecision: releaseDatePrecision ?? this.releaseDatePrecision,
        uri: uri ?? this.uri,
        artists: artists ?? this.artists,
        externalUrls: externalUrls ?? this.externalUrls,
        totalTracks: totalTracks ?? this.totalTracks,
    );
}

class ExternalUrls2 {
    String? spotify;

    ExternalUrls2({this.spotify});

    ExternalUrls2.fromJson(Map<String, dynamic> json) {
        if(json["spotify"] is String) {
            spotify = json["spotify"];
        }
    }

    static List<ExternalUrls2> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ExternalUrls2.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["spotify"] = spotify;
        return _data;
    }

    ExternalUrls2 copyWith({
        String? spotify,
    }) => ExternalUrls2(
        spotify: spotify ?? this.spotify,
    );
}

class Artists {
    ExternalUrls1? externalUrls;
    String? href;
    String? id;
    String? name;
    String? type;
    String? uri;

    Artists({this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

    Artists.fromJson(Map<String, dynamic> json) {
        if(json["external_urls"] is Map) {
            externalUrls = json["external_urls"] == null ? null : ExternalUrls1.fromJson(json["external_urls"]);
        }
        if(json["href"] is String) {
            href = json["href"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["uri"] is String) {
            uri = json["uri"];
        }
    }

    static List<Artists> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Artists.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(externalUrls != null) {
            _data["external_urls"] = externalUrls?.toJson();
        }
        _data["href"] = href;
        _data["id"] = id;
        _data["name"] = name;
        _data["type"] = type;
        _data["uri"] = uri;
        return _data;
    }

    Artists copyWith({
        ExternalUrls1? externalUrls,
        String? href,
        String? id,
        String? name,
        String? type,
        String? uri,
    }) => Artists(
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        uri: uri ?? this.uri,
    );
}

class ExternalUrls1 {
    String? spotify;

    ExternalUrls1({this.spotify});

    ExternalUrls1.fromJson(Map<String, dynamic> json) {
        if(json["spotify"] is String) {
            spotify = json["spotify"];
        }
    }

    static List<ExternalUrls1> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ExternalUrls1.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["spotify"] = spotify;
        return _data;
    }

    ExternalUrls1 copyWith({
        String? spotify,
    }) => ExternalUrls1(
        spotify: spotify ?? this.spotify,
    );
}

class Images {
    int? height;
    String? url;
    int? width;

    Images({this.height, this.url, this.width});

    Images.fromJson(Map<String, dynamic> json) {
        if(json["height"] is int) {
            height = json["height"];
        }
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
    }

    static List<Images> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Images.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["height"] = height;
        _data["url"] = url;
        _data["width"] = width;
        return _data;
    }

    Images copyWith({
        int? height,
        String? url,
        int? width,
    }) => Images(
        height: height ?? this.height,
        url: url ?? this.url,
        width: width ?? this.width,
    );
}

class AddedBy {
    ExternalUrls? externalUrls;
    String? href;
    String? id;
    String? type;
    String? uri;

    AddedBy({this.externalUrls, this.href, this.id, this.type, this.uri});

    AddedBy.fromJson(Map<String, dynamic> json) {
        if(json["external_urls"] is Map) {
            externalUrls = json["external_urls"] == null ? null : ExternalUrls.fromJson(json["external_urls"]);
        }
        if(json["href"] is String) {
            href = json["href"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["type"] is String) {
            type = json["type"];
        }
        if(json["uri"] is String) {
            uri = json["uri"];
        }
    }

    static List<AddedBy> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => AddedBy.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(externalUrls != null) {
            _data["external_urls"] = externalUrls?.toJson();
        }
        _data["href"] = href;
        _data["id"] = id;
        _data["type"] = type;
        _data["uri"] = uri;
        return _data;
    }

    AddedBy copyWith({
        ExternalUrls? externalUrls,
        String? href,
        String? id,
        String? type,
        String? uri,
    }) => AddedBy(
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        type: type ?? this.type,
        uri: uri ?? this.uri,
    );
}

class ExternalUrls {
    String? spotify;

    ExternalUrls({this.spotify});

    ExternalUrls.fromJson(Map<String, dynamic> json) {
        if(json["spotify"] is String) {
            spotify = json["spotify"];
        }
    }

    static List<ExternalUrls> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ExternalUrls.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["spotify"] = spotify;
        return _data;
    }

    ExternalUrls copyWith({
        String? spotify,
    }) => ExternalUrls(
        spotify: spotify ?? this.spotify,
    );
}