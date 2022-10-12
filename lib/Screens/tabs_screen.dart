import 'package:flutter/material.dart';
import 'package:meals_app/Screens/catagories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';
import 'package:meals_app/models/meals.dart';

import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
//  const TabsScreen({Key? key}) : super(key: key);
List<Meal> favMeals;
TabsScreen(this.favMeals); 

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    List<Map<String, dynamic>>? _pages ;
  @override
  initState(){
_pages=[
    {'page': const CategoriesScreen(), 'title': 'Categories'},
    {'page':  FavoriteScreen(widget.favMeals), 'title': 'Favorites'}
  ];
    super.initState();
  }

  int _selectedTabIndex = 0;

  void _selectedTab(int i) {
    setState(() {
      _selectedTabIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedTabIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const MainDrawer(),
      body: Container(
          color: Theme.of(context).backgroundColor,
          child: _pages![_selectedTabIndex]['page']),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: _selectedTab,
          selectedItemColor: Theme.of(context).backgroundColor,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedTabIndex,
          //type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
          ]),
    );
  }
}
