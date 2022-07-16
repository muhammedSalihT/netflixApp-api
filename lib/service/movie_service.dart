import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflixapp/data/api_constends.dart';
import 'package:netflixapp/models/trending_movie.dart';

class MovieService {
  static Future<List<TrendingMovie>> fetchMovies(
      {required String endUrl, required String lan}) async {
    final response = await http.get(Uri.parse(
      '${Api.url + endUrl}?api_key=${Api.apiKey + lan}',
    ));

    if (response.statusCode == 200) {
      print(response);
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  static Future<List> getSimilerMovies( {required int id, required String lan}) async {
    final response = await http.get(Uri.parse(
      '${Api.url}/movie/$id/similar?api_key=${Api.apiKey + lan}',
    ));

    if (response.statusCode == 200) {
      print(response);
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  // static Future<List> getVedios( {required String key,}) async {
  //   final response = await http.get(Uri.parse(
  //     '${Api.url}/movie/https://www.youtube.com/watch?v=$key?api_key=${Api.apiKey}&append_to_response=videos',
  //   ));

  //   if (response.statusCode == 200) {
  //     print(response);
  //     final result = jsonDecode(response.body);
  //     Iterable list = result['results'];
  //     return list.map((movie) => TrendingMovie.fromjson(movie)).toList();
  //   } else {
  //     throw Exception("Failed to load movies!");
  //   }
  // }
}
