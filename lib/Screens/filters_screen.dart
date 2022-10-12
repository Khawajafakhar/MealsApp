import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeKey = 'filters-screen';
  Function selectedFilters;
  Map<String, bool> filters;
  FiltersScreen(this.selectedFilters, this.filters);

  // const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _isGlutenFree;
  bool? _isVegan ;
  bool? _isVegetarian;
  bool? _isLactoseFree;

  @override
  initState() {
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegeterian'];

    super.initState();
  }

  Widget _buildSwitvhTile(
      String text, String discription, bool value, Function(bool) onSwitch) {
    return SwitchListTile(
        title: Text(text),
        subtitle: Text(discription),
        value: value,
        onChanged: onSwitch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> newFilters = {
                'gluten': _isGlutenFree!,
                'lactose': _isLactoseFree!,
                'vegan': _isVegan!,
                'vegeterian': _isVegetarian!,
              };
              widget.selectedFilters(newFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
          padding: EdgeInsets.all(20),
          color: Theme.of(context).backgroundColor,
          child: Center(
              child: Column(
            children: [
              const Text(
                'Choose your Filters!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildSwitvhTile(
                  'Gluten-Free', 'Show all gluten free meals', _isGlutenFree!,
                  (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              }),
              _buildSwitvhTile('Vegan', 'Show all Vegan meals', _isVegan!,
                  (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              _buildSwitvhTile(
                  'Vegetarian', 'Show all vegetarian meals', _isVegetarian!,
                  (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              }),
              _buildSwitvhTile(
                  'Lactose-Free', 'Show all lactose free meals', _isLactoseFree!,
                  (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              })
            ],
          ))),
    );
  }
}
