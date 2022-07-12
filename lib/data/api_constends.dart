// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:netflixapp/models/feature_movie_model.dart';
// import 'package:netflixapp/models/movie_model.dart';
// import 'package:netflixapp/models/movies_result_model.dart';



// class Api {
  
//    static const  url = "https://api.themoviedb.org/3";
//    static const  apiKey = "cbf993dee362f007e50177122ed7a343";

//   Future<List<GenreModel>> getGenreList() async {
//     final response = await http.get('$url/genre/movie/list?api_key=$apiKey');

//     if (response.statusCode == 200) {
//       final parsed =
//           json.decode(response.body)['genres'].cast<Map<String, dynamic>>();

//       return parsed
//           .map<GenreModel>((json) => GenreModel.fromJson(json))
//           .toList();
//     } else {
//       // If that response was not OK, throw an error.
//       throw Exception('Failed to load post');
//     }
//   }

//   Future<List<FeaturedMovieModel>> getFeaturedMovies() async {
//     final response = await http.get('$url/trending/movie/day?api_key=$apiKey');
//     print(response.body);
//     if (response.statusCode == 200) {
//       final parsed =
//           json.decode(response.body)['results'].cast<Map<String, dynamic>>();
//           print(parsed);
//       return parsed
//           .map<FeaturedMovieModel>((json) => FeaturedMovieModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Failed to load featured movies');
//     }
//   }

//   Future<MovieModel> getMovieInfo(int movieId) async{
//     final response = await http.get("$url/movie/$movieId?api_key=$apiKey");

//     if (response.statusCode == 200){
//       return MovieModel.fromJson(json.decode(response.body));
//     } else{
//       throw Exception('Failed to load Movie Information');
//     }
//   }
// }
