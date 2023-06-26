import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../../core/ui/theme_extension.dart';
import '../../../../models/movie_detail_model.dart';

class MovieDetailTitle extends StatelessWidget {
  final MovieDetailModel? movieDetail;

  const MovieDetailTitle({required this.movieDetail, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            movieDetail?.title ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          RatingStars(
            value: (movieDetail?.stars ?? 1) / 2,
            starSize: 14,
            valueLabelVisibility: false,
            starColor: context.orangeTheme,
          ),
          const SizedBox(height: 10),
          Text(
            movieDetail?.genres.map((e) => e.name).join(', ') ?? '',
            style: TextStyle(color: context.greyTheme, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
