import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/components/product_card.dart';
import 'package:nectar_groceries_app/data/product.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;
  final String category;
  final String listDirection;

  const ProductList({
    super.key,
    required this.products,
    required this.category,
    required this.listDirection,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return widget.listDirection == "row"
        ? Column(
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
        )
        : GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 162.32 / 248.51, 
          shrinkWrap:
              true, // << permet au grid de s'adapter à la taileehhle du contenu
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(widget.products.length, (idx) {
            return ProductCard(product: widget.products[idx]);
          }),
        );
  }
}
