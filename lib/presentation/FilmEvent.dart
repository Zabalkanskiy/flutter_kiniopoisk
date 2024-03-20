import 'package:equatable/equatable.dart';

abstract class FilmEvent extends Equatable{
  const FilmEvent();


  @override
  List<Object> get props => [];
}

class GetFilmInfo extends FilmEvent {
  final String filmId;

  GetFilmInfo(this.filmId);
}