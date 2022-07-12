import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String title;
  final String releaseDate;
  final String backdropPath;
  final String? overView;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
    this.overView,
  }) : assert(id != null, 'movie id must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
  
   
}
