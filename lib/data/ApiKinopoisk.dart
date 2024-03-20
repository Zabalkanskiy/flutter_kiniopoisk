import 'package:dio/dio.dart';
import 'package:flutter_kiniopoisk/domain/Filmjson.dart';
import 'package:flutter_kiniopoisk/domain/KinopoiskJson.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String _url = 'https://kinopoiskapiunofficial.tech/api/v2.2/films/';

  //TOP_100_POPULAR_FILMS
  //0

  Future<Kinopoisk> fetchKinopoiskList(String type, String page) async {
    try {
      Response response = await _dio.get(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=2',
        options: Options(
          headers: {
            'X-API-KEY': 'e30ffed0-76ab-4dd6-b41f-4c9da2b2735b',
          },
        ),
      );
      // _dio.options.headers["X-API-KEY"] = "e30ffed0-76ab-4dd6-b41f-4c9da2b2735b";
      // Response response = await _dio.get("${_url}top/?type=${type}&page=${page}");
      return Kinopoisk.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Kinopoisk.withError("Data not found / Connection issue");
    }
  }

  Future<FilmInfo> fetchFilmInfo(String filmId) async {
    try {
      Response response = await _dio.get(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/${filmId}/',
        options: Options(
          headers: {
            'X-API-KEY': 'e30ffed0-76ab-4dd6-b41f-4c9da2b2735b',
          },
        ),
      );
      return FilmInfo.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FilmInfo.withError("Data not found / Connection issue");
    }
  }


}