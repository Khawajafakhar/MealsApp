import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  //const FavoriteScreen({ Key? key }) : super(key: key);

  List<Meal> favMeals;

  FavoriteScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if(favMeals.isEmpty){
          return Center(
      child: Text(
        'No Meals are Selected as Favorite!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );

    }else{
      return Container(
        color: Theme.of(context).backgroundColor,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
                id: favMeals[index].id,
                title: favMeals[index].title,
                imageUrl: favMeals[index].imageUrl,
                duration: favMeals[index].duration,
                complexity: favMeals[index].complexity,
                affordability: favMeals[index].affordability,
                );
          },
          itemCount: favMeals.length,
        ),
      );
    }
   
  }
}
