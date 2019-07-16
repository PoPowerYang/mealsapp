import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final String routeName = '/FilterScreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegatarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {

    return SwitchListTile(
                  title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                  value: currentValue,
                  subtitle: Text(description),
                  onChanged: updateValue,
                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter'),),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.all(8),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free', 
                  'Only include gluten-free meals.', 
                  _glutenFree, 
                  (newValue) {
                    setState(() {
                     _glutenFree = newValue; 
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Lactose-free', 
                  'Only include lactose-free meals.', 
                  _lactoseFree, 
                  (newValue) {
                    setState(() {
                     _lactoseFree = newValue; 
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Vegetarian', 
                  'Only include Vegetarian meals', 
                  _vegatarian, 
                  (newValue) {
                    setState(() {
                     _vegatarian = newValue; 
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                     _vegan = newValue; 
                    });
                  }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}