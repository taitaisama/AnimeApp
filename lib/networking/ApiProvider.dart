import 'package:AnimeApp/networking/CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _urlPart3 = "?q=";
  final String _baseUrl = "https://api.jikan.moe/v3/search/";
  final String _urlPart2 = "&page=1";
  Future<dynamic> get(String url, String animeOrMange) async {
    var responseJson;
    try {
      final response =
          await http.get(_baseUrl + animeOrMange + _urlPart3 + url + _urlPart2);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 405:

      case 404:
        throw DataNotFound(response.body.toString());
      case 429:
        throw TooMany(response.body.toString());
      case 500:
      case 503:
        throw Server(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
