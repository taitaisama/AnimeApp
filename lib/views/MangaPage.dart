import 'package:AnimeApp/models/Manga.dart';
import 'package:flutter/material.dart';

import 'package:AnimeApp/views/MainPage.dart';

class ShowMangaInfo extends StatefulWidget {
  final Mangas current;
  const ShowMangaInfo(this.current);

  @override
  _ShowCurrentState createState() => _ShowCurrentState(current);
}

class _ShowCurrentState extends State<ShowMangaInfo> {
  Mangas _manga;
  _ShowCurrentState(Mangas current) {
    _manga = current;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Search Manga"),
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
              child: Text(_manga.title + '\n', style: TextStyle(fontSize: 25))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child:
                  Text("Type: " + _manga.type, style: TextStyle(fontSize: 18))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              child: Text("Rating = " + _manga.score.toString() + "\n",
                  style: TextStyle(fontSize: 18))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 10),
              child: Text(_manga.synopsis, style: TextStyle(fontSize: 16))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 8),
              child: Text(_manga.url, style: TextStyle(fontSize: 16))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 5),
              child: Text("Chapters = " + _manga.chapters.toString(),
                  style: TextStyle(fontSize: 18))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 5),
              child: Text("Startdate = " + _manga.startDate,
                  style: TextStyle(fontSize: 16))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 3),
              child: Text("EndDate = " + _manga.endDate,
                  style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
