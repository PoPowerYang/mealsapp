import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    this.title, 
    this.imageURL,
    this.duration,
    this.complexity,
    this.affordability,
  });

  void selectMeal() {

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageURL, 
                      height: 250, 
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}