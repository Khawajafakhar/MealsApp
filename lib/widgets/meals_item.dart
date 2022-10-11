import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals_details_screeen.dart';

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

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';

        break;
      case Complexity.Hard:
        return 'Hard';

        break;
      default:
        return 'Unkown';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

        break;
      case Affordability.Pricey:
        return 'Pricey';

        break;
      case Affordability.Luxurious:
        return 'Luxurious';

        break;
      default:
        return 'Unkown';
    }
  }

  void detailsScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealsDetailsScreen.MealsDetailsScreenRouteKey,arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>  detailsScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image(image: NetworkImage(imageUrl!), fit: BoxFit.cover),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      padding: const EdgeInsets.all(5),
                      color: Colors.black54,
                      child: Text(
                        title!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      )))
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            color: Colors.white,
            child: Row(children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.schedule, size: 15),
                      const SizedBox(width: 5),
                      Text('$duration min')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.work, size: 15),
                    const SizedBox(width: 5),
                    Text(getComplexity, textAlign: TextAlign.center)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.attach_money, size: 15),
                    const SizedBox(width: 5),
                    Text(getAffordability, textAlign: TextAlign.center)
                  ],
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
