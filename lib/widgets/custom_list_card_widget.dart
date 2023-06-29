import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../utils/apis.utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            API.REQUEST_IMG(movie.posterPath),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Popularity: ${movie.popularity.toString()}',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Imdb: ${movie.voteAverage.toString()}',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Text(
                      'Sinopse: ${movie.overview.toString()}',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
