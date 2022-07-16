import 'package:flutter/material.dart';
import 'package:netflixapp/models/trending_movie.dart';
import 'package:netflixapp/presentation/Home/detail_screen.dart';
import 'package:netflixapp/service/movie_service.dart';

class SimilerList extends StatelessWidget {
  const SimilerList({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: MovieService.getSimilerMovies(id: id,lan: "&with_origin_country=IN"),
        builder: (context, AsyncSnapshot<List> snapshot) {
           if (snapshot.hasError) {
                    return const Center(
                        child: Text('Loading Failed',
                            style: TextStyle(color: Colors.red)));
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(backgroundColor: Colors.red,),
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
        },
      ),
    );
  }
}
