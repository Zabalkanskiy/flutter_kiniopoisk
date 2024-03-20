import 'package:flutter_kiniopoisk/data/ApiKinopoisk.dart';
import 'package:flutter_kiniopoisk/domain/KinopoiskJson.dart';

import '../domain/Filmjson.dart';

class ApiKinopoiskRepository {
  final _provider = ApiProvider();
  //TOP_100_POPULAR_FILMS
  //0

  Future<Kinopoisk> fetchKinopoisk (){
    return _provider.fetchKinopoiskList("TOP_100_POPULAR_FILMS", 0.toString());
  }

  Future<FilmInfo> fetchFilmInfo(String filmId) {
    return _provider.fetchFilmInfo(filmId);
  }
}

class NetworkError extends Error {}