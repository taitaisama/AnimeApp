class Mangas {
  int malId;
  String url;
  String imageUrl;
  String title;
  bool publishing;
  String synopsis;
  String type;
  int chapters;
  int volumes;
  double score;
  String startDate;
  String endDate;
  int members;

  Mangas(
      {this.malId,
      this.url,
      this.imageUrl,
      this.title,
      this.publishing,
      this.synopsis,
      this.type,
      this.chapters,
      this.volumes,
      this.score,
      this.startDate,
      this.endDate,
      this.members});

  Mangas.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    title = json['title'];
    publishing = json['publishing'];
    synopsis = json['synopsis'];
    type = json['type'];
    chapters = json['chapters'];
    volumes = json['volumes'];
    score = json['score'] + 0.0;
    startDate = json['start_date'];
    endDate = json['end_date'];
    members = json['members'];
  }
  //nichijou, this one will depend on taste, pretty great comedy imo
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mal_id'] = this.malId;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['publishing'] = this.publishing;
    data['synopsis'] = this.synopsis;
    data['type'] = this.type;
    data['chapters'] = this.chapters;
    data['volumes'] = this.volumes;
    data['score'] = this.score + 0.0;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['members'] = this.members;
    return data;
  }
}
