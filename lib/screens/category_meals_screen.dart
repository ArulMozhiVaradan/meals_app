import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadInitData = false;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadInitData){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData=true;
    }
    
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title:Text(categoryTitle)),
          body: Center(
        child: ListView.builder(itemBuilder: (ctx,index){
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title, 
            affordability: displayedMeals[index].affordability, 
            complexity: displayedMeals[index].complexity, 
            duration: displayedMeals[index].duration, 
            imageUrl: displayedMeals[index].imageUrl,
            removeItem: _removeMeal);
        },itemCount: displayedMeals.length,),
      ),
    );
  }
}