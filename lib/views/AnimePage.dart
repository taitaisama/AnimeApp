import 'package:AnimeApp/models/Animes.dart';
import 'package:flutter/material.dart';

import 'package:AnimeApp/views/MainPage.dart';

class ShowAnimeInfo extends StatefulWidget {
  final Anime current;
  const ShowAnimeInfo(this.current);

  @override
  _ShowCurrentState createState() => _ShowCurrentState(current);
}

class _ShowCurrentState extends State<ShowAnimeInfo> {
  Anime _anime;
  _ShowCurrentState(Anime current) {
    _anime = current;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Search Animes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
        children: [
          Center(
              child: Text(_anime.title + '\n', style: TextStyle(fontSize: 25))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child:
                  Text("Type: " + _anime.type, style: TextStyle(fontSize: 18))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              child: Text("Rating = " + _anime.score.toString() + "\n",
                  style: TextStyle(fontSize: 18))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 10),
              child: Text(_anime.synopsis, style: TextStyle(fontSize: 16))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 8),
              child: Text(_anime.url, style: TextStyle(fontSize: 16))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 5),
              child: Text("Episodes = " + _anime.episodes.toString(),
                  style: TextStyle(fontSize: 18))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 5),
              child: Text("Startdate = " + _anime.startDate,
                  style: TextStyle(fontSize: 16))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 3),
              child: Text("EndDate = " + _anime.endDate,
                  style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
