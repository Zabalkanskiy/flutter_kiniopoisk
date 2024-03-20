import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kiniopoisk/domain/KinopoiskJson.dart';
import 'package:flutter_kiniopoisk/presentation/KinopiskEvent.dart';
import 'package:flutter_kiniopoisk/presentation/KinopoiskBloc.dart';
import 'package:flutter_kiniopoisk/presentation/KinopoiskState.dart';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final KinopoiskBloc _newsBloc = KinopoiskBloc();

  @override
  void initState() {
    _newsBloc.add(GetListFilm());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kinopoisk Film')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<KinopoiskBloc, KinopoiskState>(
          listener: (context, state) {
            if (state is KinopoiskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<KinopoiskBloc, KinopoiskState>(
            builder: (context, state) {
              if (state is KinopoiskInitial) {
                return _buildLoading();
              } else if (state is KinopoiskLoading) {
                return _buildLoading();
              } else if (state is KinopoiskLoaded) {
                return _buildCard(context, state.kinopoiskModel);
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

  Widget _buildCard(BuildContext context, Kinopoisk model) {
    return ListView.builder(
      itemCount: model.films.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                        "Country: ${joinCountries(
                            model.films[index].countries)}"),
                    Text("Name Film: ${model.films[index].nameRu}"),
                    Image.network(model.films[index].posterUrl)
                  ],
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutScreen(index: index,);
            }));
          },);
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  String joinCountries(List<Country> countries) {
    return countries.map((country) => country.country).join(', ');
  }
}

class AboutScreen extends StatelessWidget {
  final int index;

  AboutScreen({required this.index});



  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("Film")),
      body: Center(child:

      Container(child: Text("Descriptions $index"),
      )
        ,)
      ,);
}





