import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/movies_provider.dart';
import 'package:flutter_application_1/search/search_delegate.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Películas en Cines'),
          elevation: 0,
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              //Slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(), //Opcional
              ),
            ],
          ),
        ));
  }
}
/*
Widget _swiperTargetas() {
  return Container(
    width: double.infinity,
    height: 300.0,
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "http://via.placeholder.com/350x150",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    ),
  );
}
*/