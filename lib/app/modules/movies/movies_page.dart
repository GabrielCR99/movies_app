import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'movies_controller.dart';
import 'widgets/movies_filter.dart';
import 'widgets/movies_group.dart';
import 'widgets/movies_header.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});

  final _controller = Get.find<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            MoviesHeader(),
            MoviesFilter(),
            MoviesGroup(
              title: 'Mais populares',
              movies: _controller.popularMovies,
            ),
            MoviesGroup(
              title: 'Top Filmes',
              movies: _controller.topRatedMovies,
            ),
          ],
        ),
      ),
    );
  }
}
