import 'package:flutter/material.dart';
import 'package:meals_app/Screens/catagories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Recipe App'),
            backgroundColor: Theme.of(context).primaryColor,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(icon: Icon(Icons.favorite_border), text: 'Favorites'),
            ]),
          ),
          body: const TabBarView(
              children: [CategoriesScreen(), FavoriteScreen()]),
        ));
  }
}
