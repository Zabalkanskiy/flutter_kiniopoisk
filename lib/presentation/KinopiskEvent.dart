import 'package:equatable/equatable.dart';

abstract class KinopoiskEvent extends Equatable {
  const KinopoiskEvent();

  @override
  List<Object> get props => [];
}

class GetListFilm extends KinopoiskEvent {}