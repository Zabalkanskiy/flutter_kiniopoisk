
import 'package:equatable/equatable.dart';
import 'package:flutter_kiniopoisk/domain/Filmjson.dart';

abstract class FilmState extends Equatable {
  const FilmState();


  @override
  List<Object> get props => [];
}

class FilmInitial extends FilmState {}

class FilmLoading extends FilmState {}

class FilmLoaded extends FilmState {
  final FilmInfo filmInfoModel;
  const FilmLoaded(this.filmInfoModel);
}

class FilmError extends FilmState {
  final String? message;
  const FilmError(this.message);
}