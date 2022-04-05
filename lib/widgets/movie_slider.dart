import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';

class MovieSlider extends StatelessWidget {
  //recibir las peliculas y el titulo (opcional)
  final List<Movie> movies;
  final String? title;

  const MovieSlider({Key? key, required this.movies, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //sino hay titulo no mostrar este widgets
          if (this.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                this.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) => _MoviePoster(movies[index])),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  //recibir final Movie movie:
  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
