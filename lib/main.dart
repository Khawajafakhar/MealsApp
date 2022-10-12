import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meals_details_screeen.dart';
import 'package:meals_app/Screens/tabs_screen.dart';
import 'package:meals_app/catagories_dummy.dart';
import 'package:meals_app/models/meals.dart';
import './widgets/categories_item.dart';
import './Screens/category_recipe_screen.dart';
import './Screens/catagories_screen.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favMeals = [];

  void _setFilters(Map<String, bool> _newFilters) {
    setState(() {
      _filters = _newFilters;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten']! && !element.isGlutenFree!) {
          return false;
        }
        if (_filters['lactose']! && !element.isLactoseFree!) {
          return false;
        }
        if (_filters['vegan']! && !element.isVegan!) {
          return false;
        }
        if (_filters['vegeterian']! && !element.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealid) {
    final existingIndex =
        _favMeals.indexWhere((element) => element.id == mealid);
    if (existingIndex >= 0) {
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favMeals.any((element) => element.id == mealId);
  }

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
        '/': (context) => TabsScreen(_favMeals),
        CategoriesScreen.categoriesScreenRouteKey: (context) =>
            CategoryRecipeScreen(_availableMeals),
        MealsDetailsScreen.MealsDetailsScreenRouteKey: (context) =>
            MealsDetailsScreen(_toggleFavorites, _isFavorite),
        FiltersScreen.routeKey: (context) =>
            FiltersScreen(_setFilters, _filters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      },
    );
  }
}
