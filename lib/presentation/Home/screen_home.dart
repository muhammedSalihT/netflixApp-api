import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/widget/app_bar_widget.dart';
import 'package:netflixapp/presentation/widget/main_card.dart';
import 'package:netflixapp/presentation/widget/main_title.dart';
import 'package:netflixapp/presentation/widget/number_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflixapp/models/trending_movie.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<TrendingMovie> _trending = <TrendingMovie>[];
  List<TrendingMovie> _pastList = <TrendingMovie>[];
  List<TrendingMovie> _tvShows = <TrendingMovie>[];

  @override
  void initState() {
    super.initState();
    _trendingMovies();
    _pastMovies();
    _topTvShows();
  }

  void _trendingMovies() async {
    final trending = await fetchAllMovies();

    setState(() {
      _trending = trending;
    });
  }

  void _pastMovies() async {
    final past = await fetchPastMovies();

    setState(() {
      _pastList = past;
    });
  }

  void _topTvShows() async {
    final tv = await topTvShows();

    setState(() {
      _tvShows = tv;
    });
  }

  Future<List<TrendingMovie>> fetchAllMovies() async {
    final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/all/day?api_key=cbf993dee362f007e50177122ed7a343',
    ));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  Future<List<TrendingMovie>> fetchPastMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/tv/popular?api_key=cbf993dee362f007e50177122ed7a343&language=en-US&page=1'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  Future<List<TrendingMovie>> topTvShows() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/tv/on_the_air?api_key=cbf993dee362f007e50177122ed7a343&language=en-US&page=1'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'NetfLix',
          )),
      body: ListView(children: [
        kHeight,
        MainTitle(title: 'Released in the past year'),
        kHeight,
        MainCard(
          movies: _pastList,
        ),
        kHeight,
        MainTitle(
          title: "Trending Now",
        ),
        kHeight,
        MainCard(movies: _trending),
        kHeight,
        MainTitle(title: 'Top 10 tv shows in india today'),
        kHeight,
        NumberCard(movies: _tvShows),
        kHeight,
        MainTitle(
          title: " Tense Dramas",
        ),
        kHeight,
        MainCard(movies: _trending),
        kHeight,
        MainTitle(
          title: "South indian cinema",
        ),
        kHeight,
        MainCard(movies: _trending)
      ]),
    );
  }
}
