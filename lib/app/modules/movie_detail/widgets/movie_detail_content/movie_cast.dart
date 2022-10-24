import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../core/ui/theme_extension.dart';
import '../../../../models/cast_model.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;

  const MovieCast({required this.cast, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: cast?.image ?? '',
              imageErrorBuilder: (_, __, ___) =>
                  const Center(child: Icon(Icons.error, color: Colors.red)),
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cast?.name ?? '',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            cast?.character ?? '',
            style: TextStyle(fontSize: 12, color: context.greyTheme),
          ),
        ],
      ),
    );
  }
}
