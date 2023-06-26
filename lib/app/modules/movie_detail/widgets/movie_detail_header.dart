import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/ui/widgets/nil.dart';
import '../../../models/movie_detail_model.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movieDetail;
  final List<String> images;

  const MovieDetailHeader({
    required this.movieDetail,
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return movieDetail != null
        ? SizedBox(
            height: 278,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(2),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: images[index],
                ),
              ),
              itemCount: images.length,
            ),
          )
        : const Nil();
  }
}
