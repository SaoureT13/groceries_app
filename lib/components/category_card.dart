import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/data/category.dart';
import 'package:nectar_groceries_app/pages/category_products.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProducts(category: category),
          ),
        );
      },
      child: Container(
        width: 174.5,
        height: 189.11,
        decoration: BoxDecoration(
          color: hexToColor(category.color).withValues(alpha: 0.1),
          border: Border.all(color: hexToColor(category.color)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(category.image),
              const SizedBox(height: 12),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Ajoute l'opacité (FF = 100%)
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
