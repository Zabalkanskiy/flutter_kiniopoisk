import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kiniopoisk/domain/KinopoiskJson.dart';
import 'package:flutter_kiniopoisk/presentation/KinopoiskBloc.dart';
import 'package:flutter_kiniopoisk/presentation/KinopiskEvent.dart';
import 'package:flutter_kiniopoisk/presentation/KinopoiskState.dart';

class KinopoiskPage extends StatefulWidget {
  const KinopoiskPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KinopoiskPageState();
  }

}

class _KinopoiskPageState extends State<KinopoiskPage> {
  final KinopoiskBloc _kinopoiskBloc = KinopoiskBloc();

  @override
  void initState() {
    _kinopoiskBloc.add(GetListFilm());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(title: Text('KinoFilm App'),),
    //     body: Container(
    //       margin: EdgeInsets.all(8.0),
    //       child: BlocProvider(
    //         create: (_) => _kinopoiskBloc,
    //         child: BlocListener(listener: (inBlocContext, state){
    //           if (state is KinopoiskError){
    //             ScaffoldMessenger.of(inBlocContext).showSnackBar(
    //                 SnackBar(content: Text(state.message ?? "Unknow Message")));
    //           }
    //         },
    //         child:
    //           BlocBuilder<KinopoiskBloc, KinopoiskState>(
    //             builder: (inContext, state) {
    //               if (state is KinopoiskInitial){
    //                 return _buildLoading();
    //               } else if (state is KinopoiskLoaded) {
    //                 return _buildLoading();
    //               } else if (state is KinopoiskLoaded){
    //                 return _buildCard(inContext, state.kinopoiskModel);
    //               } else if (state is KinopoiskError) {
    //                 return Container();
    //               } else {
    //                 return Container();
    //               }
    //             },
    //           ),),
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(title: Text('KinoFilm App'),),
      body: BlocProvider(
        create: (_) => _kinopoiskBloc,
        child: BlocListener(
          listener: (inBlocContext, state) {
            if (state is KinopoiskError) {
              ScaffoldMessenger.of(inBlocContext).showSnackBar(
                  SnackBar(content: Text(state.message ?? "Unknow Message")));
            }
          },
          child:
          BlocBuilder<KinopoiskBloc, KinopoiskState>(
            builder: (inContext, state) {
              if (state is KinopoiskInitial) {
                return _buildLoading();
              } else if (state is KinopoiskLoaded) {
                return _buildLoading();
              } else if (state is KinopoiskLoaded) {
                return _buildCard(inContext, state.kinopoiskModel);
              } else if (state is KinopoiskError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

  Widget _buildLoading() => const Center(child: CircularProgressIndicator(),);

  Widget _buildCard(BuildContext context, Kinopoisk model) {
    return ListView.builder(
        itemCount: model.films.length, itemBuilder: (inContext, index) {
      return Container(
        margin: EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                //   model.films[index].nameRu
                Text("Name Film ${model.films[index].nameRu}"),
                Text("Year: ${model.films[index].year}")
              ],
            ),
          ),
        ),);
    });
  }
