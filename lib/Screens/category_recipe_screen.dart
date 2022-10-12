// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/catagories_dummy.dart';
import 'package:meals_app/widgets/meals_item.dart';
import '../models/meals.dart';

class CategoryRecipeScreen extends StatefulWidget {
  List<Meal> availableMeals;
  //const CategoryRecipeScreen({ Key? key }) : super(key: key);
  CategoryRecipeScreen(this.availableMeals);
  @override
  State<CategoryRecipeScreen> createState() => _CategoryRecipeScreenState();
}

class _CategoryRecipeScreenState extends State<CategoryRecipeScreen> {
  String? categoryTitle;
  String? categoryId;
  List<Meal>? categoryMeals;
  bool isLoaded=false;
  @override
  void didChangeDependencies(){
    if(!isLoaded){
      print(isLoaded);
final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    categoryTitle = routArgs['title'];
     categoryId = routArgs['id'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    isLoaded=true;
    print(isLoaded);}
  }
  void removeId(String val){
    print('RemoveId working');
    setState(() {
      categoryMeals!.removeWhere((element) => element.id==val);
    });
    
    print('deleted');
  }
   
//  final id;
//  final title;

//     CategoryRecipeScreen(this.id,this.title);

  
  // const CategoryRecipeScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
                id: categoryMeals![index].id,
                title: categoryMeals![index].title,
                imageUrl: categoryMeals![index].imageUrl,
                duration: categoryMeals![index].duration,
                complexity: categoryMeals![index].complexity,
                affordability: categoryMeals![index].affordability,
              );
          },
          itemCount: categoryMeals!.length,
        ),
      ),
    );
  }
}
