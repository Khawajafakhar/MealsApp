// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/catagories_dummy.dart';

class CategoryRecipeScreen extends StatelessWidget {
 // const CategoryRecipeScreen({ Key? key }) : super(key: key);
//  final id;
//  final title;

//     CategoryRecipeScreen(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryTitle=routArgs['title'];
    final categoryId=routArgs['id'];
    final categoryMeals=DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle), backgroundColor: Theme.of(context).primaryColor,),
      body: Container(color: Theme.of(context).backgroundColor,
        child: ListView.builder(itemBuilder: (context,index){
            return Text(categoryMeals[index].title!);
        },itemCount: categoryMeals.length,),
          
        ),
      );
    
  }
}