import 'package:AnimeApp/networking/ApiProvider.dart';
import 'dart:async';
import 'package:AnimeApp/models/AnimeList.dart';

class AnimeListRepo {
  ApiProvider _provider = ApiProvider();

  Future<AnimeList> fetchData(String query) async {
    final response = await _provider.get(query, "anime");
    return AnimeList.fromJson(response);
  }
} //jujutsu kaisen, might be recency bias but gojo satorou is hot
