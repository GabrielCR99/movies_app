import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';
import '../../../models/genre_model.dart';

class FilterTag extends StatelessWidget {
  final GenreModel genre;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    required this.genre,
    required this.onPressed,
    this.selected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          color: selected ? context.redTheme : Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            genre.name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
