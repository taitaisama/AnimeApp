import 'package:AnimeApp/models/Manga.dart';

//Attack on titan, pretty sure you know all about it already
//and well if you dont, its a great place  to start anime!
class MangaList {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Mangas> results;
  int lastPage;

  MangaList(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.results,
      this.lastPage});

  MangaList.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['results'] != null) {
      results = new List<Mangas>();
      json['results'].forEach((v) {
        results.add(new Mangas.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['last_page'] = this.lastPage;
    return data;
  }
}
