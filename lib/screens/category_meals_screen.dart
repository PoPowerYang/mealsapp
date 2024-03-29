import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = ' ';
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs = 
        ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryID = routeArgs['id'];
      displayedMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
     displayedMeals.removeWhere((meal) => meal.id == mealId); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(categoryTitle),
        ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imageURL: displayedMeals[index].imageUrl,
              removeItem: _removeMeal,
            );
          }, 
      itemCount: displayedMeals.length,
      ),
    );
  }
}