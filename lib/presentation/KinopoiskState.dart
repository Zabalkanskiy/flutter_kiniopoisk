import 'package:equatable/equatable.dart';
import 'package:flutter_kiniopoisk/presentation/KinopiskEvent.dart';

import '../domain/KinopoiskJson.dart';

abstract class KinopoiskState extends Equatable {
  const KinopoiskState();

  @override

  List<Object?> get props => [];


}

class KinopoiskInitial extends KinopoiskState {}

class KinopoiskLoading extends KinopoiskState {}

class KinopoiskLoaded extends KinopoiskState {
  final Kinopoisk kinopoiskModel;
  const KinopoiskLoaded(this.kinopoiskModel);
}

class KinopoiskError extends KinopoiskState {
  final String? message;
  const KinopoiskError(this.message);
}


