import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/models/trending_movie.dart';
import 'package:netflixapp/presentation/widget/app_bar_widget.dart';
import 'package:netflixapp/presentation/widget/text_widget.dart';
import 'package:netflixapp/service/movie_service.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "New&Hot",
          )),
      body: FutureBuilder(
          future: MovieService.fetchMovies(endUrl: '/movie/upcoming', lan: ""),
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
            List movie = snapshot.data!;
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: movie.length,
                itemBuilder: (context, index) {
                  TrendingMovie movies = movie[index];
                  String month = '';
                  String date = '';
                  try {
                    final getdate = DateTime.tryParse(movies.posterPath);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(getdate!);
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movies.releaseDate.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 260,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${movies.backdropPath}'))),
                      ),
                      TextWidget(
                        title: movies.title,
                        size: 50,
                        textColor: Colors.red,
                        weight: FontWeight.w900,
                      ),
                      TextWidget(
                        title: 'Coming on$date$month',
                        size: 30,
                        textColor: Colors.white,
                        weight: FontWeight.w300,
                      ),
                      kHeight,
                      Row(
                        children:  [
                          TextWidget(
                            title: movies.title,
                            size: 25,
                            textColor: Colors.white,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      kHeight,
                       TextWidget(
                        title:
                            movies.overview,
                        size: 20,
                        textColor: Colors.grey,
                        weight: FontWeight.w800,
                      )
                    ],
                  );
                });
          }),
    );
  }
}
