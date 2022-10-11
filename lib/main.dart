import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals_details_screeen.dart';
import 'package:meals_app/Screens/tabs_screen.dart';
import './widgets/categories_item.dart';
import './Screens/category_recipe_screen.dart';
import './Screens/catagories_screen.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      title: 'Recipe App',
      theme: theme.copyWith(
          primaryColor: Colors.pink,
          backgroundColor: const Color.fromRGBO(200, 247, 200, 1),
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.white),
          textTheme: theme.textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  color: Colors.black,
                  fontWeight: FontWeight.bold))),
      //  home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const TabsScreen(),
        CategoriesScreen.categoriesScreenRouteKey: (context) =>
            CategoryRecipeScreen(),
        MealsDetailsScreen.MealsDetailsScreenRouteKey: (context) =>
            MealsDetailsScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context)=> const CategoriesScreen() );
      },
    );
  }
}
