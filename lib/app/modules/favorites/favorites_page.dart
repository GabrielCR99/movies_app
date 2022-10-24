import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/widgets/movie_card.dart';
import 'favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: Obx(
        () => SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (e) => MovieCard(
                      movie: e,
                      favoriteCallback: () => controller.removeFavorite(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
