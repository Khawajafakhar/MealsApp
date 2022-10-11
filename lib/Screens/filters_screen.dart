import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeKey='filters-screen';
  
  
  const FiltersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Filters'),backgroundColor: Theme.of(context).primaryColor,),
    body: Container(color: Theme.of(context).backgroundColor, child: Center(child: Text('Filters'))),);
      
    
  }
}