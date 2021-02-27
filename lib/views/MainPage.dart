import 'package:flutter/material.dart';
import 'package:AnimeApp/views/AnimeListPage.dart';
import 'package:AnimeApp/views/MangaListPage.dart';
import 'package:AnimeApp/views/CharacterListPage.dart';
import 'dart:core';

List<String> recentSearches = [];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message =
      "Fed up of going from site to site to check for reviews, discussions and streams on anime? We have just the solution for you! Introducing KissAnime v2, the new and improved ad free app for looking up animes and mangas from various sites like Myanimelist, animenewsnetwork, anilist, animeplanet and many more from one spot!† Not just that, you can access streaming services from gogoanime, 4anime, kickassanime and even youtube!† Infact we have also baked in funtionality for reading mangas from tachiyomi and mangadex as well†, so what are you waiting for? Get searchin'";
  String message2 =
      "†some anime websites/streams may not be availible, we do not hold any responsibility regarding any losses faced due to delayed implementation of said functionalities \n";
  String message3 =
      "Jokes aside, the purpose if this app is to provide a convenient method to browse anime and mangas from various websites because there are too many websites to choose from. We initnially decided on doing 3 websites, MAL, ANN and anilist, however the APIs of the last two could not be implemented due to errors because of different formats, hence only MAL got implemented. The other websites might be added later if we can figure it out, as for streaming services we know that its possible but also that we can't do it because of lack of expertise. \n";
  String message4 =
      "Featurs implemented:\n 1) A search-bar that connects with the jikan Api from MAL \n 2) Options for searching anime, mangas as well as characters \n 3) storing recent searches and presenting them to the user \n 4) List view of all search results \n 5) Information about each result if you click on it";
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
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child: Text(message, style: TextStyle(fontSize: 25))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
              child: Text(message2, style: TextStyle(fontSize: 10))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child: Text(message3, style: TextStyle(fontSize: 20))),
          Padding(
              padding: EdgeInsets.fromLTRB(2, 1, 2, 8),
              child: Text(message4, style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}

enum Type { AnimeMAL, MangaMAL, CharacterMal }

class DataSearch extends SearchDelegate<String> {
  Type type = Type.AnimeMAL;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    switch (type) {
      case Type.AnimeMAL:
        return AnimeListPage(str: query);
      case Type.MangaMAL:
        return MangaListPage(str: query);
      case Type.CharacterMal:
        return CharacterListPage(str: query);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = query.isEmpty
        ? recentSearches
        : [
            "search " + query + " in Anime on MAL",
            "search " + query + " in Manga on MAL",
            "search " + query + " in Character on MAL",
          ];
    return ListView.builder(itemBuilder: (context, index) {
      if (index < suggestionList.length) {
        return ListTile(
          onTap: () {
            if (query.isEmpty) {
              query = suggestionList[index];
            } else {
              recentSearches.add(query);
              switch (index) {
                case 0:
                  type = Type.AnimeMAL;
                  break;
                case 1:
                  type = Type.MangaMAL;
                  break;
                case 2:
                  type = Type.CharacterMal;
                  break;
              }
              showResults(context);
            }
          },
          leading: Icon(Icons.arrow_right),
          title: Text(suggestionList[index]),
        );
      } else {
        return null;
      }
    });
  }
}
