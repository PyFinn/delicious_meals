import 'package:delicious_meals/original.dart';
import 'package:flutter/material.dart';

import './meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  Container _buildSectionTitle(final String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text('${meal.title}'),
          ),
          body: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle('Ingredients', context),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(meal.ingredients[index]),
                      ),
                    ),
                  )),
              _buildSectionTitle('Steps', context),
            ],
          )),
    );
  }
}
