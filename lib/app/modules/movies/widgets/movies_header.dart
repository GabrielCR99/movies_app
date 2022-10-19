import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class MoviesHeader extends StatelessWidget {
  const MoviesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196,
      width: context.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: context.width,
            child: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: context.width * 0.9,
            padding: const EdgeInsets.only(bottom: 20),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                fillColor: Colors.white,
                filled: true,
                label: Text('Procurar filmes'),
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
