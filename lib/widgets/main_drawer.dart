import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget drawerItems(
      BuildContext context, IconData icon, String text, Function onTapHandler) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      child: Card(
        elevation: 6,
        color: Theme.of(context).backgroundColor,
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          onTap: ()=> onTapHandler(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Main Drawer!',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ),
          drawerItems(context, Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          drawerItems(context, Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeKey);
          }),
        ],
      ),
    );
  }
}
