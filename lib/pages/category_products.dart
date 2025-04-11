import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_groceries_app/components/product_list.dart';
import 'package:nectar_groceries_app/data/category.dart';
import 'package:nectar_groceries_app/data/product.dart';

class CategoryProducts extends StatefulWidget {
  final Category category;
  const CategoryProducts({super.key, required this.category});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  List<Product> products = generateProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        scrolledUnderElevation: 0, // important sur Flutter 3.10+
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/settings_icon.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ProductList(
                products: products,
                category: widget.category.title,
                listDirection: "column",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
