import 'package:flutter/material.dart';
import 'package:netflixapp/models/trending_movie.dart';

class MainCard extends StatelessWidget {
  const MainCard({
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
            return InkWell(
              onTap: () {},
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
                                  image:NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${trendings.posterPath}'))),
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
          }),
    );
  }
}
