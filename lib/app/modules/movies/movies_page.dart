import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'widgets/movies_filter.dart';
import 'widgets/movies_group.dart';
import 'widgets/movies_header.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const MoviesHeader(),
            MoviesFilter(),
            const MoviesGroup(title: 'Mais populares'),
            const MoviesGroup(title: 'Top Filmes'),
          ],
        ),
      ),
    );
  }
}
