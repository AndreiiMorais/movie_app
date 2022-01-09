import 'package:flutter/cupertino.dart';
import 'package:movieapp/models/movies_model.dart';
import 'package:movieapp/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  late ValueNotifier<Movies> movies;

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
