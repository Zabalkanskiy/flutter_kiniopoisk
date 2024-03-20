import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kiniopoisk/data/ApiKinopoiskRepository.dart';
import 'package:flutter_kiniopoisk/presentation/KinopiskEvent.dart';
import 'package:flutter_kiniopoisk/presentation/KinopoiskState.dart';

class KinopoiskBloc extends Bloc<KinopoiskEvent, KinopoiskState> {
  KinopoiskBloc() : super(KinopoiskInitial()) {

    final ApiKinopoiskRepository _apiKinopoiskRepository = ApiKinopoiskRepository();

    on<GetListFilm>((event, emit) async {
      try {
        emit(KinopoiskLoading());
        final kinoModel = await _apiKinopoiskRepository.fetchKinopoisk();
        emit(KinopoiskLoaded(kinoModel));
        if(kinoModel.stringError != null){
          emit(KinopoiskError(kinoModel.stringError));
        }

      } on NetworkError {
        emit(KinopoiskError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
