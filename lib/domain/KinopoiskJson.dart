// To parse this JSON data, do
//
//     final kinopoisk = kinopoiskFromJson(jsonString);

import 'dart:convert';

Kinopoisk kinopoiskFromJson(String str) => Kinopoisk.fromJson(json.decode(str));

String kinopoiskToJson(Kinopoisk data) => json.encode(data.toJson());

class Kinopoisk {
  late int pagesCount;
  late List<Film> films;
  String? stringError;

  Kinopoisk({
    required this.pagesCount,
    required this.films,
  });

  Kinopoisk.withError(String errorMessage){
    stringError = errorMessage;
    pagesCount = 0;
    films = <Film>[];

  }

  factory Kinopoisk.fromJson(Map<String, dynamic> json) => Kinopoisk(
    pagesCount: json["pagesCount"],
    films: List<Film>.from(json["films"].map((x) => Film.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pagesCount": pagesCount,
    "films": List<dynamic>.from(films.map((x) => x.toJson())),
  };
}

class Film {
  int filmId;
  String? nameRu;
  String? nameEn;
  String? year;
  String? filmLength;
  List<Country> countries;
  List<Genre> genres;
  String? rating;
  int ratingVoteCount;
  String posterUrl;
  String posterUrlPreview;
  dynamic ratingChange;
  dynamic isRatingUp;
  int isAfisha;

  Film({
    required this.filmId,
    required this.nameRu,
    required this.nameEn,
    required this.year,
    required this.filmLength,
    required this.countries,
    required this.genres,
    required this.rating,
    required this.ratingVoteCount,
    required this.posterUrl,
    required this.posterUrlPreview,
    required this.ratingChange,
    required this.isRatingUp,
    required this.isAfisha,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    filmId: json["filmId"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    year: json["year"],
    filmLength: json["filmLength"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    rating: json["rating"],
    ratingVoteCount: json["ratingVoteCount"],
    posterUrl: json["posterUrl"],
    posterUrlPreview: json["posterUrlPreview"],
    ratingChange: json["ratingChange"],
    isRatingUp: json["isRatingUp"],
    isAfisha: json["isAfisha"],
  );

  Map<String, dynamic> toJson() => {
    "filmId": filmId,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "year": year,
    "filmLength": filmLength,
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "rating": rating,
    "ratingVoteCount": ratingVoteCount,
    "posterUrl": posterUrl,
    "posterUrlPreview": posterUrlPreview,
    "ratingChange": ratingChange,
    "isRatingUp": isRatingUp,
    "isAfisha": isAfisha,
  };
}

class Country {
  String country;

  Country({
    required this.country,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}

class Genre {
  String genre;

  Genre({
    required this.genre,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    genre: json["genre"],
  );

  Map<String, dynamic> toJson() => {
    "genre": genre,
  };
}
