import 'package:AnimeApp/models/Animes.dart';

class AnimeList {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Anime> results;
  int lastPage;

  AnimeList(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.results,
      this.lastPage});

  AnimeList.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['results'] != null) {
      results = new List<Anime>();
      json['results'].forEach((v) {
        results.add(new Anime.fromJson(v));
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
