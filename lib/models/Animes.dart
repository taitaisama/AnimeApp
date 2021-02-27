class Anime {
  int malId;
  String url;
  String imageUrl;
  String title;
  bool airing;
  String synopsis;
  String type;
  int episodes;
  double score;
  String startDate;
  String endDate;
  int members;
  String rated;

  Anime(
      {this.malId,
      this.url,
      this.imageUrl,
      this.title,
      this.airing,
      this.synopsis,
      this.type,
      this.episodes,
      this.score,
      this.startDate,
      this.endDate,
      this.members,
      this.rated});

  Anime.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    title = json['title'];
    airing = json['airing'];
    synopsis = json['synopsis'];
    type = json['type'];
    episodes = json['episodes'];
    score = json['score'] + 0.0;
    startDate = json['start_date'];
    endDate = json['end_date'];
    members = json['members'];
    rated = json['rated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['airing'] = this.airing;
    data['synopsis'] = this.synopsis;
    data['type'] = this.type;
    data['episodes'] = this.episodes;
    data['score'] = this.score + 0.0;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['members'] = this.members;
    data['rated'] = this.rated;
    return data;
  }
}
