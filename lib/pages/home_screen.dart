import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_groceries_app/components/product_list.dart';
import 'package:nectar_groceries_app/components/search_bar.dart';
import 'package:nectar_groceries_app/data/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchBarController = TextEditingController();
  String? search;
  bool isEditing = false;
  List<Product> products = generateProducts();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchBarController.dispose();
  }

  final List<String> images = [
    "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png",
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Fond de la status bar
        statusBarIconBrightness: Brightness.dark, // Icônes en noir
        statusBarBrightness: Brightness.light, // Pour iOS (texte noir)
        systemNavigationBarColor: Colors.white, // (facultatif)
        systemNavigationBarIconBrightness: Brightness.dark, // (facultatif)
      ),
    );

    List<Product> filteredProducts =
        search == null || search == ""
            ? products
            : products.where((product) {
              return search != null &&
                  product.name.toString().toLowerCase().contains(
                    search!.toLowerCase(),
                  );
            }).toList();
    Map<String, List<Product>> sortedProducts = {};

    for (var product in filteredProducts) {
      final category = product.category;
      if (sortedProducts.containsKey(category)) {
        sortedProducts[category]!.add(product);
      } else {
        sortedProducts[category] = [product];
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/colored_carott_icon.svg",
                          width: 26.48,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/location_icon.svg"),
                          Text(
                            " Dhaka, Banassre",
                            style: TextStyle(
                              color: Color(0xff4C4F4D),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: CustomSearchBar(
                          controller: searchBarController,
                          onChanged: (value) {
                            setState(() {
                              search = value;
                              isEditing = value.isNotEmpty;
                            });
                          },
                          isEditing: isEditing,
                          onClear: () {
                            setState(() {
                              search = null;
                              searchBarController.clear();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Column(
                  children:
                      sortedProducts.entries.map((entry) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: ProductList(
                            category: entry.key,
                            products: entry.value,
                            listDirection: "row",
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
