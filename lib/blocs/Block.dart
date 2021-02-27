import 'dart:async';

import 'package:AnimeApp/networking/ApiResponse.dart';
import 'package:AnimeApp/repository/getAnimeList.dart';
import 'package:AnimeApp/models/AnimeList.dart';
import 'package:AnimeApp/repository/getMangaList.dart';
import 'package:AnimeApp/repository/getCharacterList.dart';
import 'package:AnimeApp/models/MangaList.dart';
import 'package:AnimeApp/models/CharacterList.dart';

class AnimeBlock {
  AnimeListRepo _aniRepo;
  StreamController _controller;

  StreamSink<Response<AnimeList>> get listSink => _controller.sink;

  Stream<Response<AnimeList>> get listStream => _controller.stream;

  AnimeBlock(String query) {
    _controller = StreamController<Response<AnimeList>>();
    _aniRepo = AnimeListRepo();
    fetch(query);
  }

  fetch(String query) async {
    listSink.add(Response.loading('Getting Animes, please wait'));
    try {
      AnimeList l = await _aniRepo.fetchData(query);
      listSink.add(Response.completed(l));
    } catch (e) {
      listSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller?.close();
  }
}

class MangaBlock {
  MangaListRepo _aniRepo;
  StreamController _controller;

  StreamSink<Response<MangaList>> get listSink => _controller.sink;

  Stream<Response<MangaList>> get listStream => _controller.stream;

  MangaBlock(String query) {
    _controller = StreamController<Response<MangaList>>();
    _aniRepo = MangaListRepo();
    fetch(query);
  }

  fetch(String query) async {
    listSink.add(Response.loading('Getting Mangas, please wait'));
    try {
      MangaList l = await _aniRepo.fetchData(query);
      listSink.add(Response.completed(l));
    } catch (e) {
      listSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller?.close();
  }
}

class CharacterBlock {
  CharacterListRepo _aniRepo;
  StreamController _controller;

  StreamSink<Response<CharacterList>> get listSink => _controller.sink;

  Stream<Response<CharacterList>> get listStream => _controller.stream;

  CharacterBlock(String query) {
    _controller = StreamController<Response<CharacterList>>();
    _aniRepo = CharacterListRepo();
    fetch(query);
  }

  fetch(String query) async {
    listSink.add(Response.loading('Getting Waifus, please wait'));
    try {
      CharacterList l = await _aniRepo.fetchData(query);
      listSink.add(Response.completed(l));
    } catch (e) {
      listSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _controller?.close();
  }
}
