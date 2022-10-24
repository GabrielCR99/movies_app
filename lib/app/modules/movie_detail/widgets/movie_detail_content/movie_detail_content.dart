import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';
import 'movie_detail_content_credits.dart';
import 'movie_detail_content_main_cast.dart';
import 'movie_detail_content_production_companies.dart';
import 'movie_detail_title.dart';

class MovieDetailContent extends StatelessWidget {
  final MovieDetailModel? movieDetail;

  const MovieDetailContent({required this.movieDetail, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailTitle(movieDetail: movieDetail),
        MovieDetailContentCredits(movieDetail: movieDetail),
        MovieDetailContentProductionCompanies(movieDetail: movieDetail),
        MovieDetailContentMainCast(movieDetail: movieDetail),
      ],
    );
  }
}
