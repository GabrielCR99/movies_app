import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';
import 'filter_tag.dart';

class MoviesFilter extends StatelessWidget {
  MoviesFilter({super.key});

  final _controller = Get.find<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 20),
      child: Obx(
        () => Row(
          children: _controller.genres
              .map(
                (genre) => FilterTag(
                  genre: genre,
                  onPressed: () => _controller.filterMoviesByGenres(genre),
                  selected: _controller.genreSelected.value?.id == genre.id,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
