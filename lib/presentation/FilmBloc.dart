
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kiniopoisk/presentation/FilmEvent.dart';
import 'package:flutter_kiniopoisk/presentation/FilmState.dart';

import '../data/ApiKinopoiskRepository.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  FilmBloc() : super(FilmInitial()) {

    final ApiKinopoiskRepository apiKinopoiskRepository = ApiKinopoiskRepository();

    on<GetFilmInfo>((event, emit) async {
      try {
        emit(FilmLoading());
        final filmModel = await apiKinopoiskRepository.fetchFilmInfo(event.filmId);
        emit(FilmLoaded(filmModel));
        if(filmModel.stringError != null){
          emit(FilmError(filmModel.stringError));
        }

      } on NetworkError {
        emit(const FilmError("Failed to fetch data. is your device online?"));
      }
    });
  }
}