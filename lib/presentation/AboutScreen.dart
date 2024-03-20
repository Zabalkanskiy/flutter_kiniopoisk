import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kiniopoisk/domain/Filmjson.dart';
import 'package:flutter_kiniopoisk/presentation/FilmEvent.dart';
import 'package:flutter_kiniopoisk/presentation/FilmState.dart';

import 'FilmBloc.dart';

class AboutFilm extends StatefulWidget {
  final int indexFilm;
  final String nameFilm;

  AboutFilm({required this.indexFilm, required this.nameFilm});

  @override
  State<AboutFilm> createState() => _AboutFilmState();
}

class _AboutFilmState extends State<AboutFilm> {
  final FilmBloc _filmInfoBloc = FilmBloc();

  @override
  void initState() {
    _filmInfoBloc.add(GetFilmInfo(widget.indexFilm.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: BlocProvider(
          create: (_) => _filmInfoBloc,
          child: BlocListener<FilmBloc, FilmState>(
            listener: (context, state) {
              if (state is FilmError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<FilmBloc, FilmState>(
              builder: (context, state) {
                if (state is FilmInitial) {
                  return _buildLoading();
                } else if (state is FilmLoading) {
                  return _buildLoading();
                } else if (state is FilmLoaded) {
                  return _nestedScroll(context, state.filmInfoModel);
                } else if (state is FilmError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          )));

  Widget _nestedScroll(BuildContext context, FilmInfo model) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            title: Text(
              "${widget.nameFilm}",
              style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
            ),
            iconTheme: IconThemeData(color: Colors.blueGrey),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,

              // title: Text("Name Film ${widget.nameFilm}",
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 16.0,
              //     )),

              background: Image.network(
                model?.posterUrl ?? "https://placehold.co/400",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: Center(
          child: Container(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Padding(padding: EdgeInsets.all(8),  child:Text("${model.description}", style: TextStyle(fontSize: 14, ), textAlign: TextAlign.start,) ,) ,
        ),
      )
          //  Text("Description: ${model.description}"),
          ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}

Widget build(BuildContext context) {
  return Scaffold(
    body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: Center(
        child: Text("Sample Text"),
      ),
    ),
  );
}
