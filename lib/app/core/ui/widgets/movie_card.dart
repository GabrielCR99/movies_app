import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../models/movie_model.dart';
import '../movies_app_icons.dart';
import '../theme_extension.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback favoriteCallback;

  const MovieCard({
    required this.movie,
    required this.favoriteCallback,
    super.key,
  });

  static final _dateFormat = DateFormat('dd/MM/y');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/movie-detail', arguments: movie.id),
      child: SizedBox(
        width: 158,
        height: 280,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: FadeInImage.memoryNetwork(
                        image: movie.posterPath,
                        placeholder: kTransparentImage,
                        width: 148,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    _dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 90,
              right: -10,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: favoriteCallback,
                    iconSize: 13,
                    icon: Icon(
                      movie.favorite
                          ? MoviesAppIcons.heart
                          : MoviesAppIcons.emptyHeart,
                      color:
                          movie.favorite ? context.redTheme : context.greyTheme,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
