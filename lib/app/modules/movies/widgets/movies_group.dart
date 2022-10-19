import 'package:flutter/material.dart';

import '../../../core/ui/widgets/movie_card.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  const MoviesGroup({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => const MovieCard(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
