

import 'package:flutter/material.dart';

import '../models/meals.dart';

class MealsItem extends StatelessWidget {
  // const MealsItem({Key? key}) : super(key: key);
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  const MealsItem(
      {Key? key,
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // ignore: prefer_const_literals_to_create_immutables
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image(image: NetworkImage(imageUrl!), fit: BoxFit.cover),
            ),
            Text(title!)
            ],
        ),
      ),
    );
  }
}
