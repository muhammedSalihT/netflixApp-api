import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/models/trending_movie.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<TrendingMovie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final trendings = movies[index];
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
                              decoration:  BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${trendings.posterPath}'))),
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
                      left: 9,
                      bottom: -27,
                      child: BorderedText(
                          strokeWidth: 10.0,
                          strokeColor: Colors.white,
                          child: Text(
                            '$index',
                            style: const TextStyle(
                                fontSize: 110,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          )))
                ],
              ),
            );
          }),
    );
  }
}
