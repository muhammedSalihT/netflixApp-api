class TrendingMovie {
  final String posterPath;

  TrendingMovie({required this.posterPath});

  factory TrendingMovie.fromjson(Map<String, dynamic> json) {
    return TrendingMovie(posterPath: json["poster_path"]);
  }
}
