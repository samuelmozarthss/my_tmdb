import 'package:flutter/material.dart';
import 'package:tmdb/repositories/movies_repository.dart';

import '../models/movies_model.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async {
    movies!.value = await _moviesRepository.getMovies();
  }
}
