// import 'package:flutter/material.dart';
// import 'package:netflixapp/core/constants.dart';
// import 'package:netflixapp/presentation/widget/app_bar_widget.dart';
// import 'package:netflixapp/presentation/widget/main_card.dart';
// import 'package:netflixapp/presentation/widget/main_title.dart';
// import 'package:netflixapp/presentation/widget/number_card.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:netflixapp/models/trending_movie.dart';
// import 'package:netflixapp/service/movie_service.dart';

// class ScreenHome extends StatefulWidget {
//   const ScreenHome({Key? key}) : super(key: key);

//   @override
//   State<ScreenHome> createState() => _ScreenHomeState();
// }

// class _ScreenHomeState extends State<ScreenHome> {
//   List<TrendingMovie> _trending = <TrendingMovie>[];
//   List<TrendingMovie> _nowplay = <TrendingMovie>[];
//   List<TrendingMovie> _tvShows = <TrendingMovie>[];
//   List<TrendingMovie> _dramas = <TrendingMovie>[];
//    List<TrendingMovie> _southMovies = <TrendingMovie>[];

//   @override
//   void initState() {
//     super.initState();
//     _trendingMovies();
//     _nowPlaying();
//     _topTvShows();
//     _drama();
//     _south();
//   }

//   void _trendingMovies() async {
//     final trending =
//         await MovieService.fetchMovies(endUrl: '/movie/top_rated', lan: '');

//     setState(() {
//       _trending = trending;
//     });
//   }

//   void _nowPlaying() async {
//     final now =
//         await MovieService.fetchMovies(endUrl: '/movie/now_playing', lan: '');

//     setState(() {
//       _nowplay = now;
//     });
//   }

//   void _topTvShows() async {
//     final tv = await MovieService.fetchMovies(
//         endUrl: '/tv/popular', lan: '&with_origin_country=IN');

//     setState(() {
//       _tvShows = tv;
//     });
//   }

//   void _drama() async {
//     final drama =
//         await MovieService.fetchMovies(endUrl: '/tv/top_rated', lan: '');

//     setState(() {
//       _dramas = drama;
//     });
//   }

//   void _south() async {
//     final south =
//         await MovieService.fetchMovies(endUrl:'/movie/now_playing', lan:'&with_origin_country=IN' );

//     setState(() {
//       _southMovies = south;
//     });
//   }

//   // Future<List<TrendingMovie>> fetchPastMovies() async {
//   //   final response = await http.get(Uri.parse(
//   //       'https://api.themoviedb.org/3/tv/popular?api_key=cbf993dee362f007e50177122ed7a343&language=en-US&page=1'));

//   //   if (response.statusCode == 200) {
//   //     final result = jsonDecode(response.body);
//   //     Iterable list = result['results'];
//   //     return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
//   //   } else {
//   //     throw Exception("Failed to load movies!");
//   //   }
//   // }

//   // Future<List<TrendingMovie>> topTvShows() async {
//   //   final response = await http.get(Uri.parse(
//   //       'https://api.themoviedb.org/3/tv/on_the_air?api_key=cbf993dee362f007e50177122ed7a343&language=en-US&page=1'));

//   //   if (response.statusCode == 200) {
//   //     final result = jsonDecode(response.body);
//   //     Iterable list = result['results'];
//   //     return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
//   //   } else {
//   //     throw Exception("Failed to load movies!");
//   //   }
//   // }z

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: AppBarWidget(
//             title: 'NetfLix',
//           )),
//       body: ListView(children: [
//         kHeight,
//         MainTitle(title: 'Now Playing'),
//         kHeight,
//         MainCard(
//           movies: _nowplay,
//         ),
//         kHeight,
//         MainTitle(
//           title: "Trending Now",
//         ),
//         kHeight,
//         MainCard(movies: _trending),
//         kHeight,
//         MainTitle(title: 'Top 10 tv shows in india today'),
//         kHeight,
//         NumberCard(movies: _tvShows),
//         kHeight,
//         MainTitle(
//           title: " Tense Dramas",
//         ),
//         kHeight,
//         MainCard(movies: _dramas),
//         kHeight,
//         MainTitle(
//           title: "South indian cinema",
//         ),
//         kHeight,
//         MainCard(movies: _southMovies,)
//       ]),
//     );
//   }
// }
