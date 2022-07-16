import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/models/trending_movie.dart';
import 'package:netflixapp/presentation/Home/similer_list.dart';
import 'package:netflixapp/presentation/widget/text_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final TrendingMovie movies;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movies.backdropPath}'))),
                width: double.infinity,
                height: 240,
              ),
              TextWidget(
                title: "${movies.title}(${movies.originalLanguage})",
                size: screenSize.width * .09,
                textColor: const Color.fromARGB(255, 180, 13, 13),
                weight: FontWeight.w900,
              ),
              kHeight,
              TextWidget(
                title: movies.overview,
                size: 20,
                textColor: Colors.grey,
                weight: FontWeight.w800,
              ),
              kHeight,
              const TextWidget(title: "Similer Movies", size: 25, textColor: Colors.white, weight: FontWeight.w900),
             kHeight,
             SimilerList(id: movies.id),
            ],
          ),
        ],
      ),
    );
  }
}
