import 'package:AnimeApp/models/CharacterList.dart';
import 'package:AnimeApp/networking/ApiProvider.dart';
import 'dart:async';

class CharacterListRepo {
  ApiProvider _provider = ApiProvider();

  Future<CharacterList> fetchData(String query) async {
    final response = await _provider.get(query, "character");
    return CharacterList.fromJson(response);
  }
}
