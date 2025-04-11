import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/components/category_card.dart';
import 'package:nectar_groceries_app/data/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Category> categories = generateCategory();
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 174.5 / 189.11, // correspond à tes dimensions
      shrinkWrap:
          true, // << permet au grid de s'adapter à la taileehhle du contenu
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(categories.length, (idx) {
        return CategoryCard(category: categories[idx]);
      }),
      // children: List.generate(100, (index) {
      //   return Center(
      //     child: Text(
      //       'Item $index',
      //       style: TextTheme.of(context).headlineSmall,
      //     ),
      //   );
      // }),
    );
  }
}
