import 'dart:convert';

class Album {
  final String id;
  final String name;
  final String releaseDate;
  final String label;
  final List<Artist> artists;
  final List<Track> tracks;
  final List<AlbumImage> images;

  Album({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.label,
    required this.artists,
    required this.tracks,
    required this.images,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    var artistList = json['artists'] as List;
    List<Artist> artists = artistList.map((i) => Artist.fromJson(i)).toList();

    var trackList = json['tracks']['items'] as List;
    List<Track> tracks = trackList.map((i) => Track.fromJson(i)).toList();

    var imageList = json['images'] as List;
    List<AlbumImage> images = imageList.map((i) => AlbumImage.fromJson(i)).toList();

    return Album(
      id: json['id'],
      name: json['name'],
      releaseDate: json['release_date'],
      label: json['label'],
      artists: artists,
      tracks: tracks,
      images: images,
    );
  }
}

class Artist {
  final String id;
  final String name;

  Artist({required this.id, required this.name});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Track {
  final String id;
  final String name;
  final int duration;
  final String previewUrl;

  Track({required this.id, required this.name, required this.duration, required this.previewUrl});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      name: json['name'],
      duration: json['duration_ms'],
      previewUrl: json['preview_url'],
    );
  }
}

class AlbumImage {
  final int height;
  final int width;
  final String url;

  AlbumImage({required this.height, required this.width, required this.url});

  factory AlbumImage.fromJson(Map<String, dynamic> json) {
    return AlbumImage(
      height: json['height'],
      width: json['width'],
      url: json['url'],
    );
  }
}
