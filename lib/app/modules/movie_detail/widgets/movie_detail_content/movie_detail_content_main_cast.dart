import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/ui/theme_extension.dart';
import '../../../../models/movie_detail_model.dart';
import 'movie_cast.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movieDetail;

  MovieDetailContentMainCast({required this.movieDetail, super.key});

  final showPanel = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: context.greyTheme),
        Obx(
          () => ExpansionPanelList(
            expansionCallback: (_, __) => showPanel.toggle(),
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            children: [
              ExpansionPanel(
                headerBuilder: (_, isExpanded) => Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Elenco',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movieDetail?.cast
                            .map((e) => MovieCast(cast: e))
                            .toList() ??
                        const [],
                  ),
                ),
                isExpanded: showPanel.value,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
