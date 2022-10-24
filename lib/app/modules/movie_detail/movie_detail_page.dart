import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/widgets/nil.dart';
import 'movie_detail_controller.dart';
import 'widgets/movie_detail_content/movie_detail_content.dart';
import 'widgets/movie_detail_header.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe')),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.movie.value == null
              ? const Nil()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieDetailHeader(
                      movieDetail: controller.movie.value,
                      images: controller.movieImages,
                    ),
                    MovieDetailContent(movieDetail: controller.movie.value),
                  ],
                ),
        ),
      ),
    );
  }
}
