import 'package:flutter/material.dart';

import '../../../../models/movie_detail_model.dart';

class MovieDetailContentProductionCompanies extends StatelessWidget {
  final MovieDetailModel? movieDetail;

  const MovieDetailContentProductionCompanies({
    required this.movieDetail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: RichText(
        text: TextSpan(
          text: 'Companhia(s) produtora(s): ',
          style: const TextStyle(
            color: Color(0xFF222222),
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: movieDetail?.productionCompanies.join(', ') ?? '',
              style: const TextStyle(
                color: Color(0xFF222222),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
