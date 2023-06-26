import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../movies_controller.dart';

class MoviesHeader extends StatelessWidget {
  MoviesHeader({super.key});

  final _controller = Get.find<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: context.width,
            child: Image.asset('assets/images/header.png', fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            width: context.width * 0.9,
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Procurar filmes'),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              onChanged: _controller.filterByName,
            ),
          ),
        ],
      ),
    );
  }
}
