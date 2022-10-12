import 'package:flutter/material.dart';
import 'package:meals_app/catagories_dummy.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const MealsDetailsScreenRouteKey = 'meals-details-screen';
  Function toggleFavorite;
  Function isFavorite;

  MealsDetailsScreen(this.toggleFavorite, this.isFavorite);

  // final String? categoryTitle;
  // MealsDetailsScreen({@required this.categoryTitle});

  // MealsDetailsScreen({Key? key}) : super(key: key);

  Widget showTitle(BuildContext context, String text) {
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

  Widget showSteps(Widget child, BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      color: Theme.of(context).colorScheme.secondary,
      child: child,
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
      body: SingleChildScrollView(
        child: Container(
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
              showTitle(context, 'Ingrediants'),
              showSteps(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                            color: Theme.of(context).backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                meals.ingredients![index],
                                style: TextStyle(fontSize: 16),
                              ),
                            )),
                      );
                    },
                    itemCount: meals.ingredients!.length,
                  ),
                  context),
              showTitle(context, 'Steps'),
              showSteps(
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(children: [
                        ListTile(
                          leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              radius: 35,
                              child: Text(
                                '#${index + 1}',
                                style: const TextStyle(color: Colors.black),
                              )),
                          title: Card(
                              color: Theme.of(context).backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  meals.steps![index],
                                  style: TextStyle(fontSize: 16),
                                ),
                              )),
                        ),
                        const Divider()
                      ]);
                    },
                    itemCount: meals.steps!.length,
                  ),
                  context)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          toggleFavorite(recipeId);
        },
        child: Icon(isFavorite(recipeId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
