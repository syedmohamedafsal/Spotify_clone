
class SearchModel {
    Data? data;

    SearchModel({this.data});

    SearchModel.fromJson(Map<String, dynamic> json) {
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data.fromJson(json["data"]);
        }
    }

    static List<SearchModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => SearchModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }

    SearchModel copyWith({
        Data? data,
    }) => SearchModel(
        data: data ?? this.data,
    );
}

class Data {
    String? uri;
    String? id;
    String? name;
    AlbumOfTrack? albumOfTrack;
    Artists? artists;
    ContentRating? contentRating;
    Duration? duration;
    Playability? playability;

    Data({this.uri, this.id, this.name, this.albumOfTrack, this.artists, this.contentRating, this.duration, this.playability});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["albumOfTrack"] is Map) {
            albumOfTrack = json["albumOfTrack"] == null ? null : AlbumOfTrack.fromJson(json["albumOfTrack"]);
        }
        if(json["artists"] is Map) {
            artists = json["artists"] == null ? null : Artists.fromJson(json["artists"]);
        }
        if(json["contentRating"] is Map) {
            contentRating = json["contentRating"] == null ? null : ContentRating.fromJson(json["contentRating"]);
        }
        if(json["duration"] is Map) {
            duration = json["duration"] == null ? null : Duration.fromJson(json["duration"]);
        }
        if(json["playability"] is Map) {
            playability = json["playability"] == null ? null : Playability.fromJson(json["playability"]);
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["uri"] = uri;
        _data["id"] = id;
        _data["name"] = name;
        if(albumOfTrack != null) {
            _data["albumOfTrack"] = albumOfTrack?.toJson();
        }
        if(artists != null) {
            _data["artists"] = artists?.toJson();
        }
        if(contentRating != null) {
            _data["contentRating"] = contentRating?.toJson();
        }
        if(duration != null) {
            _data["duration"] = duration?.toJson();
        }
        if(playability != null) {
            _data["playability"] = playability?.toJson();
        }
        return _data;
    }

    Data copyWith({
        String? uri,
        String? id,
        String? name,
        AlbumOfTrack? albumOfTrack,
        Artists? artists,
        ContentRating? contentRating,
        Duration? duration,
        Playability? playability,
    }) => Data(
        uri: uri ?? this.uri,
        id: id ?? this.id,
        name: name ?? this.name,
        albumOfTrack: albumOfTrack ?? this.albumOfTrack,
        artists: artists ?? this.artists,
        contentRating: contentRating ?? this.contentRating,
        duration: duration ?? this.duration,
        playability: playability ?? this.playability,
    );
}

class Playability {
    bool? playable;

    Playability({this.playable});

    Playability.fromJson(Map<String, dynamic> json) {
        if(json["playable"] is bool) {
            playable = json["playable"];
        }
    }

    static List<Playability> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Playability.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["playable"] = playable;
        return _data;
    }

    Playability copyWith({
        bool? playable,
    }) => Playability(
        playable: playable ?? this.playable,
    );
}

class Duration {
    int? totalMilliseconds;

    Duration({this.totalMilliseconds});

    Duration.fromJson(Map<String, dynamic> json) {
        if(json["totalMilliseconds"] is int) {
            totalMilliseconds = json["totalMilliseconds"];
        }
    }

    static List<Duration> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Duration.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["totalMilliseconds"] = totalMilliseconds;
        return _data;
    }

    Duration copyWith({
        int? totalMilliseconds,
    }) => Duration(
        totalMilliseconds: totalMilliseconds ?? this.totalMilliseconds,
    );
}

class ContentRating {
    String? label;

    ContentRating({this.label});

    ContentRating.fromJson(Map<String, dynamic> json) {
        if(json["label"] is String) {
            label = json["label"];
        }
    }

    static List<ContentRating> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ContentRating.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["label"] = label;
        return _data;
    }

    ContentRating copyWith({
        String? label,
    }) => ContentRating(
        label: label ?? this.label,
    );
}

class Artists {
    List<Items>? items;

    Artists({this.items});

    Artists.fromJson(Map<String, dynamic> json) {
        if(json["items"] is List) {
            items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
        }
    }

    static List<Artists> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Artists.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(items != null) {
            _data["items"] = items?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Artists copyWith({
        List<Items>? items,
    }) => Artists(
        items: items ?? this.items,
    );
}

class Items {
    String? uri;
    Profile? profile;

    Items({this.uri, this.profile});

    Items.fromJson(Map<String, dynamic> json) {
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["profile"] is Map) {
            profile = json["profile"] == null ? null : Profile.fromJson(json["profile"]);
        }
    }

    static List<Items> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Items.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["uri"] = uri;
        if(profile != null) {
            _data["profile"] = profile?.toJson();
        }
        return _data;
    }

    Items copyWith({
        String? uri,
        Profile? profile,
    }) => Items(
        uri: uri ?? this.uri,
        profile: profile ?? this.profile,
    );
}

class Profile {
    String? name;

    Profile({this.name});

    Profile.fromJson(Map<String, dynamic> json) {
        if(json["name"] is String) {
            name = json["name"];
        }
    }

    static List<Profile> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Profile.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        return _data;
    }

    Profile copyWith({
        String? name,
    }) => Profile(
        name: name ?? this.name,
    );
}

class AlbumOfTrack {
    String? uri;
    String? name;
    CoverArt? coverArt;
    String? id;

    AlbumOfTrack({this.uri, this.name, this.coverArt, this.id});

    AlbumOfTrack.fromJson(Map<String, dynamic> json) {
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["coverArt"] is Map) {
            coverArt = json["coverArt"] == null ? null : CoverArt.fromJson(json["coverArt"]);
        }
        if(json["id"] is String) {
            id = json["id"];
        }
    }

    static List<AlbumOfTrack> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => AlbumOfTrack.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["uri"] = uri;
        _data["name"] = name;
        if(coverArt != null) {
            _data["coverArt"] = coverArt?.toJson();
        }
        _data["id"] = id;
        return _data;
    }

    AlbumOfTrack copyWith({
        String? uri,
        String? name,
        CoverArt? coverArt,
        String? id,
    }) => AlbumOfTrack(
        uri: uri ?? this.uri,
        name: name ?? this.name,
        coverArt: coverArt ?? this.coverArt,
        id: id ?? this.id,
    );
}

class CoverArt {
    List<Sources>? sources;

    CoverArt({this.sources});

    CoverArt.fromJson(Map<String, dynamic> json) {
        if(json["sources"] is List) {
            sources = json["sources"] == null ? null : (json["sources"] as List).map((e) => Sources.fromJson(e)).toList();
        }
    }

    static List<CoverArt> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CoverArt.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(sources != null) {
            _data["sources"] = sources?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    CoverArt copyWith({
        List<Sources>? sources,
    }) => CoverArt(
        sources: sources ?? this.sources,
    );
}

class Sources {
    String? url;
    int? width;
    int? height;

    Sources({this.url, this.width, this.height});

    Sources.fromJson(Map<String, dynamic> json) {
        if(json["url"] is String) {
            url = json["url"];
        }
        if(json["width"] is int) {
            width = json["width"];
        }
        if(json["height"] is int) {
            height = json["height"];
        }
    }

    static List<Sources> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Sources.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["width"] = width;
        _data["height"] = height;
        return _data;
    }

    Sources copyWith({
        String? url,
        int? width,
        int? height,
    }) => Sources(
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
    );
}