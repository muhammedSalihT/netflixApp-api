import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/models/trending_movie.dart';
import 'package:netflixapp/service/movie_service.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.url,
    required this.language,
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
                  index = index + 1;
                  return InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 200,
                            ),
                            SizedBox(
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
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Positioned(
                            left: -2,
                            bottom: -27,
                            child: BorderedText(
                                strokeWidth: 2.0,
                                strokeColor: Colors.white,
                                child: Text(
                                  '$index',
                                  style: const TextStyle(
                                      fontSize: 110,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(143, 0, 0, 0)),
                                )))
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
