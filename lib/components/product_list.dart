import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/components/product_card.dart';

class ProductList extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final String category;

  const ProductList({
    super.key,
    required this.products,
    required this.category,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff53B175),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.products.length,
              itemBuilder: (context, idx) {
                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: ProductCard(product: widget.products[idx]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
