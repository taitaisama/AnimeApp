import 'package:AnimeApp/networking/ApiProvider.dart';
import 'dart:async';
import 'package:AnimeApp/models/MangaList.dart';

class MangaListRepo {
  ApiProvider _provider = ApiProvider();

  Future<MangaList> fetchData(String query) async {
    final response = await _provider.get(query, "manga");
    return MangaList.fromJson(response);
  }
}
