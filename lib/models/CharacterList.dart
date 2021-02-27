import 'package:AnimeApp/models/Characters.dart';

class CharacterList {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Character> characters;
  int lastPage;

  CharacterList(
      {this.requestHash,
      this.requestCached,
      this.requestCacheExpiry,
      this.characters,
      this.lastPage});

  CharacterList.fromJson(Map<String, dynamic> json) {
    requestHash = json['request_hash'];
    requestCached = json['request_cached'];
    requestCacheExpiry = json['request_cache_expiry'];
    if (json['results'] != null) {
      characters = new List<Character>();
      json['results'].forEach((v) {
        characters.add(new Character.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_hash'] = this.requestHash;
    data['request_cached'] = this.requestCached;
    data['request_cache_expiry'] = this.requestCacheExpiry;
    if (this.characters != null) {
      data['results'] = this.characters.map((v) => v.toJson()).toList();
    } //hunter x hunter, one of the best shonens out there, if not the best
    data['last_page'] = this.lastPage;
    return data;
  }
}
