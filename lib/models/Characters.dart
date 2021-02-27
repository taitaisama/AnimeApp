class Character {
  int malId;
  String url;
  String imageUrl;
  String name;
  List<String> alternativeNames;
  List<Anime> anime;
  List<Manga> manga;

  Character(
      {this.malId,
      this.url,
      this.imageUrl,
      this.name,
      this.alternativeNames,
      this.anime,
      this.manga});

  Character.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    name = json['name'];
    alternativeNames = json['alternative_names'].cast<String>();
    if (json['anime'] != null) {
      anime = new List<Anime>();
      json['anime'].forEach((v) {
        anime.add(new Anime.fromJson(v));
      });
    }
    if (json['manga'] != null) {
      manga = new List<Manga>();
      json['manga'].forEach((v) {
        manga.add(new Manga.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['alternative_names'] = this.alternativeNames;
    if (this.anime != null) {
      data['anime'] = this.anime.map((v) => v.toJson()).toList();
    }
    if (this.manga != null) {
      data['manga'] = this.manga.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Anime {
  int malId;
  String type;
  String name;
  String url;

  Anime({this.malId, this.type, this.name, this.url});

  Anime.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Manga {
  int malId;
  String type;
  String name;
  String url;

  Manga({this.malId, this.type, this.name, this.url});

  Manga.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
//obligatory wholesome anime, watch tsurezure children for romance that'll melt your heart
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
