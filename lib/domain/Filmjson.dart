// To parse this JSON data, do
//
//     final film = filmFromJson(jsonString);

import 'dart:convert';

FilmInfo filmFromJson(String str) => FilmInfo.fromJson(json.decode(str));

String filmToJson(FilmInfo data) => json.encode(data.toJson());

class FilmInfo {
 late int kinopoiskId;
  dynamic kinopoiskHdId;
  String? imdbId;
  String? nameRu;
  dynamic nameEn;
  String? nameOriginal;
  String? posterUrl;
  String? posterUrlPreview;
  dynamic coverUrl;
  dynamic logoUrl;
  int? reviewsCount;
  double? ratingGoodReview;
  int? ratingGoodReviewVoteCount;
  double? ratingKinopoisk;
  int? ratingKinopoiskVoteCount;
  double? ratingImdb;
  int? ratingImdbVoteCount;
  double? ratingFilmCritics;
  int? ratingFilmCriticsVoteCount;
  double? ratingAwait;
  int? ratingAwaitCount;
  dynamic ratingRfCritics;
  int? ratingRfCriticsVoteCount;
  String? webUrl;
  int? year;
  int? filmLength;
  dynamic slogan;
  String? description;
  dynamic shortDescription;
  dynamic editorAnnotation;
  bool? isTicketsAvailable;
  dynamic productionStatus;
  String? type;
  String? ratingMpaa;
  dynamic ratingAgeLimits;
  List<Country>? countries;
  List<Genre>? genres;
  dynamic startYear;
  dynamic endYear;
  bool? serial;
  bool? shortFilm;
  bool? completed;
  bool? hasImax;
  bool? has3D;
  DateTime? lastSync;
  String? stringError;

  FilmInfo({
    required kinopoiskId,
    this.kinopoiskHdId,
    this.imdbId,
    this.nameRu,
    this.nameEn,
    this.nameOriginal,
    this.posterUrl,
    this.posterUrlPreview,
    this.coverUrl,
    this.logoUrl,
    this.reviewsCount,
    this.ratingGoodReview,
    this.ratingGoodReviewVoteCount,
    this.ratingKinopoisk,
    this.ratingKinopoiskVoteCount,
    this.ratingImdb,
    this.ratingImdbVoteCount,
    this.ratingFilmCritics,
    this.ratingFilmCriticsVoteCount,
    this.ratingAwait,
    this.ratingAwaitCount,
    this.ratingRfCritics,
    this.ratingRfCriticsVoteCount,
    this.webUrl,
    this.year,
    this.filmLength,
    this.slogan,
    this.description,
    this.shortDescription,
    this.editorAnnotation,
    this.isTicketsAvailable,
    this.productionStatus,
    this.type,
    this.ratingMpaa,
    this.ratingAgeLimits,
    this.countries,
    this.genres,
    this.startYear,
    this.endYear,
    this.serial,
    this.shortFilm,
    this.completed,
    this.hasImax,
    this.has3D,
    this.lastSync,
  });

  FilmInfo.withError(String errorMessage){
    stringError = errorMessage;
    kinopoiskId = 0;
  }

  factory FilmInfo.fromJson(Map<String, dynamic> json) => FilmInfo(
    kinopoiskId: json["kinopoiskId"],
    kinopoiskHdId: json["kinopoiskHDId"],
    imdbId: json["imdbId"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    nameOriginal: json["nameOriginal"],
    posterUrl: json["posterUrl"],
    posterUrlPreview: json["posterUrlPreview"],
    coverUrl: json["coverUrl"],
    logoUrl: json["logoUrl"],
    reviewsCount: json["reviewsCount"],
    ratingGoodReview: json["ratingGoodReview"],
    ratingGoodReviewVoteCount: json["ratingGoodReviewVoteCount"],
    ratingKinopoisk: json["ratingKinopoisk"].toDouble(),
    ratingKinopoiskVoteCount: json["ratingKinopoiskVoteCount"],
    ratingImdb: json["ratingImdb"],
    ratingImdbVoteCount: json["ratingImdbVoteCount"],
    ratingFilmCritics: json["ratingFilmCritics"],
    ratingFilmCriticsVoteCount: json["ratingFilmCriticsVoteCount"],
    ratingAwait: json["ratingAwait"],
    ratingAwaitCount: json["ratingAwaitCount"],
    ratingRfCritics: json["ratingRfCritics"],
    ratingRfCriticsVoteCount: json["ratingRfCriticsVoteCount"],
    webUrl: json["webUrl"],
    year: json["year"],
    filmLength: json["filmLength"],
    slogan: json["slogan"],
    description: json["description"],
    shortDescription: json["shortDescription"],
    editorAnnotation: json["editorAnnotation"],
    isTicketsAvailable: json["isTicketsAvailable"],
    productionStatus: json["productionStatus"],
    type: json["type"],
    ratingMpaa: json["ratingMpaa"],
    ratingAgeLimits: json["ratingAgeLimits"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    startYear: json["startYear"],
    endYear: json["endYear"],
    serial: json["serial"],
    shortFilm: json["shortFilm"],
    completed: json["completed"],
    hasImax: json["hasImax"],
    has3D: json["has3D"],
    lastSync: DateTime.parse(json["lastSync"]),
  );

  Map<String, dynamic> toJson() => {
    "kinopoiskId": kinopoiskId,
    "kinopoiskHDId": kinopoiskHdId,
    "imdbId": imdbId,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "nameOriginal": nameOriginal,
    "posterUrl": posterUrl,
    "posterUrlPreview": posterUrlPreview,
    "coverUrl": coverUrl,
    "logoUrl": logoUrl,
    "reviewsCount": reviewsCount,
    "ratingGoodReview": ratingGoodReview,
    "ratingGoodReviewVoteCount": ratingGoodReviewVoteCount,
    "ratingKinopoisk": ratingKinopoisk,
    "ratingKinopoiskVoteCount": ratingKinopoiskVoteCount,
    "ratingImdb": ratingImdb,
    "ratingImdbVoteCount": ratingImdbVoteCount,
    "ratingFilmCritics": ratingFilmCritics,
    "ratingFilmCriticsVoteCount": ratingFilmCriticsVoteCount,
    "ratingAwait": ratingAwait,
    "ratingAwaitCount": ratingAwaitCount,
    "ratingRfCritics": ratingRfCritics,
    "ratingRfCriticsVoteCount": ratingRfCriticsVoteCount,
    "webUrl": webUrl,
    "year": year,
    "filmLength": filmLength,
    "slogan": slogan,
    "description": description,
    "shortDescription": shortDescription,
    "editorAnnotation": editorAnnotation,
    "isTicketsAvailable": isTicketsAvailable,
    "productionStatus": productionStatus,
    "type": type,
    "ratingMpaa": ratingMpaa,
    "ratingAgeLimits": ratingAgeLimits,
    "countries": List<dynamic>.from(countries?.map((x) => x.toJson()) ?? [null]),
    "genres": List<dynamic>.from(genres?.map((x) => x.toJson()) ?? [null]),
    "startYear": startYear,
    "endYear": endYear,
    "serial": serial,
    "shortFilm": shortFilm,
    "completed": completed,
    "hasImax": hasImax,
    "has3D": has3D,
    "lastSync": lastSync?.toIso8601String(),
  };
}

class Country {
  String? country;

  Country({
    this.country,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}

class Genre {
  String? genre;

  Genre({
    this.genre,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    genre: json["genre"],
  );

  Map<String, dynamic> toJson() => {
    "genre": genre,
  };
}
