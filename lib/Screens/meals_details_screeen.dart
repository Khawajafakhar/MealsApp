import 'package:flutter/material.dart';
import 'package:meals_app/catagories_dummy.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const MealsDetailsScreenRouteKey = 'meals-details-screen';

  // final String? categoryTitle;
  // MealsDetailsScreen({@required this.categoryTitle});

  MealsDetailsScreen({Key? key}) : super(key: key);

  Widget showTitle(BuildContext context,String text){
    return Card(
                elevation: 6,
                color: Theme.of(context).primaryColor,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                    textAlign: TextAlign.start,
                  ),
                ),
              );
  }

  

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final recipeId = routeArgs['id'];
    final meals = DUMMY_MEALS.firstWhere((meal) => meal.id == recipeId);
    return Scaffold(
        appBar: AppBar(
          title: Text(meals.title!),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      meals.imageUrl!,
                      fit: BoxFit.cover,
                    )),
              ),
              showTitle(context,'Ingrediants'),
              Container(height: 200,
              width: double.infinity,
                child: ListView.builder(itemBuilder: (context,index){
                  return Card(color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(meals.ingredients![index],style: TextStyle(fontSize: 16),),
                  )) ;
                },itemCount: meals.ingredients!.length,),
              ),
              showTitle(context, 'Steps')
            ],
          ),
        ));
  }
}
