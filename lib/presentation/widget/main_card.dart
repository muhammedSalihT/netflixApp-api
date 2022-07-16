import 'package:flutter/material.dart';
import 'package:netflixapp/models/trending_movie.dart';
import 'package:netflixapp/presentation/Home/detail_screen.dart';
import 'package:netflixapp/service/movie_service.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,required this.url, required this.language,
  }) : super(key: key);
  final String url;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: FutureBuilder(
          future: MovieService.fetchMovies(endUrl: url, lan: language),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Loading Failed',
                      style: TextStyle(color: Colors.red)));
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List movie = snapshot.data!;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.length,
                itemBuilder: (context, index) {
                 TrendingMovie movies = movie[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(movies: movies),
                          ));
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${movies.posterPath}'))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
