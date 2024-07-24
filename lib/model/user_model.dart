
class UserModel {
    String? uri;
    String? name;
    String? imageUrl;
    int? followersCount;
    int? followingCount;
    List<RecentlyPlayedArtists>? recentlyPlayedArtists;
    List<PublicPlaylists>? publicPlaylists;
    int? totalPublicPlaylistsCount;
    bool? hasSpotifyImage;
    int? color;
    bool? allowFollows;
    bool? showFollows;

    UserModel({this.uri, this.name, this.imageUrl, this.followersCount, this.followingCount, this.recentlyPlayedArtists, this.publicPlaylists, this.totalPublicPlaylistsCount, this.hasSpotifyImage, this.color, this.allowFollows, this.showFollows});

    UserModel.fromJson(Map<String, dynamic> json) {
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["image_url"] is String) {
            imageUrl = json["image_url"];
        }
        if(json["followers_count"] is int) {
            followersCount = json["followers_count"];
        }
        if(json["following_count"] is int) {
            followingCount = json["following_count"];
        }
        if(json["recently_played_artists"] is List) {
            recentlyPlayedArtists = json["recently_played_artists"] == null ? null : (json["recently_played_artists"] as List).map((e) => RecentlyPlayedArtists.fromJson(e)).toList();
        }
        if(json["public_playlists"] is List) {
            publicPlaylists = json["public_playlists"] == null ? null : (json["public_playlists"] as List).map((e) => PublicPlaylists.fromJson(e)).toList();
        }
        if(json["total_public_playlists_count"] is int) {
            totalPublicPlaylistsCount = json["total_public_playlists_count"];
        }
        if(json["has_spotify_image"] is bool) {
            hasSpotifyImage = json["has_spotify_image"];
        }
        if(json["color"] is int) {
            color = json["color"];
        }
        if(json["allow_follows"] is bool) {
            allowFollows = json["allow_follows"];
        }
        if(json["show_follows"] is bool) {
            showFollows = json["show_follows"];
        }
    }

    static List<UserModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => UserModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["uri"] = uri;
        _data["name"] = name;
        _data["image_url"] = imageUrl;
        _data["followers_count"] = followersCount;
        _data["following_count"] = followingCount;
        if(recentlyPlayedArtists != null) {
            _data["recently_played_artists"] = recentlyPlayedArtists?.map((e) => e.toJson()).toList();
        }
        if(publicPlaylists != null) {
            _data["public_playlists"] = publicPlaylists?.map((e) => e.toJson()).toList();
        }
        _data["total_public_playlists_count"] = totalPublicPlaylistsCount;
        _data["has_spotify_image"] = hasSpotifyImage;
        _data["color"] = color;
        _data["allow_follows"] = allowFollows;
        _data["show_follows"] = showFollows;
        return _data;
    }

    UserModel copyWith({
        String? uri,
        String? name,
        String? imageUrl,
        int? followersCount,
        int? followingCount,
        List<RecentlyPlayedArtists>? recentlyPlayedArtists,
        List<PublicPlaylists>? publicPlaylists,
        int? totalPublicPlaylistsCount,
        bool? hasSpotifyImage,
        int? color,
        bool? allowFollows,
        bool? showFollows,
    }) => UserModel(
        uri: uri ?? this.uri,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        followersCount: followersCount ?? this.followersCount,
        followingCount: followingCount ?? this.followingCount,
        recentlyPlayedArtists: recentlyPlayedArtists ?? this.recentlyPlayedArtists,
        publicPlaylists: publicPlaylists ?? this.publicPlaylists,
        totalPublicPlaylistsCount: totalPublicPlaylistsCount ?? this.totalPublicPlaylistsCount,
        hasSpotifyImage: hasSpotifyImage ?? this.hasSpotifyImage,
        color: color ?? this.color,
        allowFollows: allowFollows ?? this.allowFollows,
        showFollows: showFollows ?? this.showFollows,
    );
}

class PublicPlaylists {
    String? uri;
    String? name;
    String? imageUrl;
    int? followersCount;
    String? ownerName;
    String? ownerUri;

    PublicPlaylists({this.uri, this.name, this.imageUrl, this.followersCount, this.ownerName, this.ownerUri});

    PublicPlaylists.fromJson(Map<String, dynamic> json) {
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["image_url"] is String) {
            imageUrl = json["image_url"];
        }
        if(json["followers_count"] is int) {
            followersCount = json["followers_count"];
        }
        if(json["owner_name"] is String) {
            ownerName = json["owner_name"];
        }
        if(json["owner_uri"] is String) {
            ownerUri = json["owner_uri"];
        }
    }

    static List<PublicPlaylists> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => PublicPlaylists.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["uri"] = uri;
        _data["name"] = name;
        _data["image_url"] = imageUrl;
        _data["followers_count"] = followersCount;
        _data["owner_name"] = ownerName;
        _data["owner_uri"] = ownerUri;
        return _data;
    }

    PublicPlaylists copyWith({
        String? uri,
        String? name,
        String? imageUrl,
        int? followersCount,
        String? ownerName,
        String? ownerUri,
    }) => PublicPlaylists(
        uri: uri ?? this.uri,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        followersCount: followersCount ?? this.followersCount,
        ownerName: ownerName ?? this.ownerName,
        ownerUri: ownerUri ?? this.ownerUri,
    );
}

class RecentlyPlayedArtists {
    String? uri;
    String? name;
    String? imageUrl;
    int? followersCount;

    RecentlyPlayedArtists({this.uri, this.name, this.imageUrl, this.followersCount});

    RecentlyPlayedArtists.fromJson(Map<String, dynamic> json) {
        if(json["uri"] is String) {
            uri = json["uri"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["image_url"] is String) {
            imageUrl = json["image_url"];
        }
        if(json["followers_count"] is int) {
            followersCount = json["followers_count"];
        }
    }

    static List<RecentlyPlayedArtists> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => RecentlyPlayedArtists.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["uri"] = uri;
        _data["name"] = name;
        _data["image_url"] = imageUrl;
        _data["followers_count"] = followersCount;
        return _data;
    }

    RecentlyPlayedArtists copyWith({
        String? uri,
        String? name,
        String? imageUrl,
        int? followersCount,
    }) => RecentlyPlayedArtists(
        uri: uri ?? this.uri,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        followersCount: followersCount ?? this.followersCount,
    );
}