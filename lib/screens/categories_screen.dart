import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((c) {
          return CategoryItem(c.id,c.title, c.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //maxWidth
            childAspectRatio: 3 / 2, //maxHeightBasedOnMaxWidth
            crossAxisSpacing: 20,//VerticalSpacing
            mainAxisSpacing: 20//HorizontalSpacing
            ),
     
    );
  }
}
