import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/widgets/movie_card.dart';
import '../../../models/movie_model.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const MoviesGroup({required this.title, required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 280,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => MovieCard(movie: movies[index]),
                itemCount: movies.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
