import 'package:flutter/material.dart';
import 'package:tmdb/controllers/movie_controller.dart';
import 'package:tmdb/repositories/movies_repository_imp.dart';
import 'package:tmdb/service/dio_service_imp.dart';

import '../models/movies_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Movies?>(
        valueListenable: _controller.movies,
        builder: (_, movies, __) => movies != null
            ? ListView.builder(
                itemCount: movies.listMovies.length,
                itemBuilder: (_, idx) => Text(movies.listMovies[idx].title),
              )
            : Container(),
      ),
    );
  }
}
