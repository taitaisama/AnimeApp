import 'package:AnimeApp/models/Characters.dart';
import 'package:flutter/material.dart';
import 'package:AnimeApp/views/MainPage.dart';

class ShowCharacterInfo extends StatefulWidget {
  final Character current;
  const ShowCharacterInfo(this.current);

  @override
  _ShowCurrentState createState() => _ShowCurrentState(current);
}

class _ShowCurrentState extends State<ShowCharacterInfo> {
  Character _character;
  _ShowCurrentState(Character current) {
    _character = current;
  }
  @override
  Widget build(BuildContext context) {
    int animeLength = _character.anime.length;
    int mangaLength = _character.manga.length;
    String C_animes = "";
    String C_mangas = "";
    for (int i = 0; i < animeLength - 1; i++) {
      C_animes += _character.anime[i].name + ", ";
    }
    C_animes += _character.anime[animeLength - 1].name;
    for (int i = 0; i < mangaLength - 1; i++) {
      C_mangas += _character.manga[i].name + ", ";
    } //Vinland Saga, saw it recently, pretty great watch
    C_mangas += _character.manga[mangaLength - 1].name;
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Search Characters"),
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
              child:
                  Text(_character.name + '\n', style: TextStyle(fontSize: 25))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child: Text("Animes: " + C_animes + "\n",
                  style: TextStyle(fontSize: 20))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child: Text("Mangas: " + C_mangas + "\n",
                  style: TextStyle(fontSize: 20))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 8),
              child: Text(_character.url, style: TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
