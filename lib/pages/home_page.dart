import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/controllers/movie_controller.dart';
import 'package:tmdb/repositories/movies_repository_imp.dart';
import 'package:tmdb/service/dio_service_imp.dart';

import '../models/movies_model.dart';
import '../utils/apis.utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ValueListenableBuilder<Movies?>(
              valueListenable: _controller.movies,
              builder: (_, movies, __) => movies != null
                  ? ListView.separated(
                      itemCount: movies.listMovies.length,
                      itemBuilder: (_, idx) => Image.network(
                        API.REQUEST_IMG(movies.listMovies[idx].posterPath),
                      ),
                      separatorBuilder: (_, __) => const Divider(),
                    )
                  : Container(),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                ),
                carouselController: _carouselController,
                items: _controller.movies.value?.listMovies.map(
                      (movie) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: const EdgeInsets.only(top: 30),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(
                                      API.REQUEST_IMG(movie.posterPath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    movie.originalTitle,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              movie.voteAverage.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade600,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 15),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.people_alt,
                                              color: Colors.blue.shade600,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              movie.popularity.toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade600,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 15),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.play_circle_filled,
                                              color: Colors.red.shade600,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              'Watch',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ).toList() ??
                    [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
