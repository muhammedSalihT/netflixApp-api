import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/models/trending_movie.dart';
import 'package:netflixapp/service/movie_service.dart';

class SearchIdileWidget extends StatelessWidget {
  const SearchIdileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Searches',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kWidth,
        Expanded(
            child: FutureBuilder(
                future:
                    MovieService.fetchMovies(endUrl: "/search/movie", lan: ""),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
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
                  List movie = snapshot.data;
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        TrendingMovie movies = movie[index];
                        return Container(
                          height: 200,
                          width: 140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${movies.backdropPath}'))),
                        );
                      });
                }))
      ],
    );
  }
}
