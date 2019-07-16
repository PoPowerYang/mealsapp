import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

import '../models/meal.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Theme.of(context).primaryColor,
            child: Text(
              text,
              style: Theme.of(context).textTheme.title,
            ),
          );
  }

  Widget buildImage(Meal selectedMeal) {
    return Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          );
  }

  Widget buildIngredients(Meal selectedMeal) {
    return buildContainer(
      ListView.builder(
              itemBuilder: (ctx, index) => Card(
                margin: EdgeInsets.all(5),
                color: Colors.white60,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              border: Border.all(color: Colors.lightBlue),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150,
            width: 350,
            child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId
    );

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildImage(selectedMeal),
            buildSectionTitle(context, 'Ingredients'),
            buildIngredients(selectedMeal),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [ 
                  ListTile(
                    leading: CircleAvatar(child: Text('# ${(index + 1)}'),),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete
        ),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}