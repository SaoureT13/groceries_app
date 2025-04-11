import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_groceries_app/components/product_list.dart';
import 'package:nectar_groceries_app/components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchBarController = TextEditingController();
  String? search;
  bool isEditing = false;
  int _selectedIndex = 0;

  List<Map<String, dynamic>> products = [
    {
      "name": "Organic Bananas",
      "description": "7pcs, Priceg",
      "price": 4.99,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    {
      "name": "Red Apples",
      "description": "6pcs, Fresh",
      "price": 3.49,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    {
      "name": "Grapes",
      "description": "1kg, Seedless",
      "price": 5.99,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    {
      "name": "Avocados",
      "description": "3pcs, Organic",
      "price": 2.79,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    // Ajout de 4 autres produits dans la même catégorie "Fruits"
    {
      "name": "Mangoes",
      "description": "4pcs, Sweet",
      "price": 6.49,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    {
      "name": "Pineapple",
      "description": "1pc, Fresh",
      "price": 3.99,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    {
      "name": "Strawberries",
      "description": "500g, Fresh",
      "price": 2.99,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },
    {
      "name": "Blueberries",
      "description": "250g, Organic",
      "price": 4.49,
      "image": "assets/images/banana_image.png",
      "category": "Fruits",
    },

    // 4 produits supplémentaires dans la catégorie "Légumes"
    {
      "name": "Carrots",
      "description": "500g, Fresh",
      "price": 1.99,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    {
      "name": "Tomatoes",
      "description": "1kg, Organic",
      "price": 2.49,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    {
      "name": "Spinach",
      "description": "300g, Fresh",
      "price": 1.69,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    {
      "name": "Cucumbers",
      "description": "2pcs, Organic",
      "price": 2.29,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    // Ajout de 4 autres produits dans la catégorie "Légumes"
    {
      "name": "Lettuce",
      "description": "1pc, Fresh",
      "price": 2.99,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    {
      "name": "Bell Peppers",
      "description": "2pcs, Organic",
      "price": 3.59,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    {
      "name": "Broccoli",
      "description": "1pc, Fresh",
      "price": 2.19,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    {
      "name": "Zucchini",
      "description": "2pcs, Organic",
      "price": 1.89,
      "image": "assets/images/banana_image.png",
      "category": "Légumes",
    },
    // 4 produits dans une autre catégorie "Céréales"
    {
      "name": "Rice",
      "description": "1kg, Organic",
      "price": 4.59,
      "image": "assets/images/banana_image.png",
      "category": "Céréales",
    },
    {
      "name": "Wheat",
      "description": "1kg, Wholegrain",
      "price": 3.99,
      "image": "assets/images/banana_image.png",
      "category": "Céréales",
    },
    {
      "name": "Oats",
      "description": "500g, Organic",
      "price": 3.49,
      "image": "assets/images/banana_image.png",
      "category": "Céréales",
    },
    {
      "name": "Barley",
      "description": "500g, Organic",
      "price": 2.79,
      "image": "assets/images/banana_image.png",
      "category": "Céréales",
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    searchBarController.dispose();
    // _tabController.dispose();
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

    List<Map<String, dynamic>> filteredProducts =
        search == null || search == ""
            ? products
            : products.where((product) {
              return search != null &&
                  product["name"].toString().toLowerCase().contains(
                    search!.toLowerCase(),
                  );
            }).toList();
    Map<String, List<Map<String, dynamic>>> sortedProducts = {};

    for (var product in filteredProducts) {
      final category = product["category"];
      if (sortedProducts.containsKey(category)) {
        sortedProducts[category]!.add(product);
      } else {
        sortedProducts[category] = [product];
      }
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff53B175),
        unselectedItemColor: Color(0xff131A2E),
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/shop_icon.svg",
              colorFilter:
                  _selectedIndex == 0
                      ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                      : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
            ),
            label: 'Shop',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/explore_icon.svg",
              colorFilter:
                  _selectedIndex == 1
                      ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                      : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
            ),
            label: 'Explore',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              colorFilter:
                  _selectedIndex == 2
                      ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                      : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
            ),
            label: 'Cart',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/favorite_icon.svg",
              colorFilter:
                  _selectedIndex == 3
                      ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                      : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
            ),
            label: 'Favourite',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/account_icon.svg",
              colorFilter:
                  _selectedIndex == 4
                      ? ColorFilter.mode(Color(0xff53B175), BlendMode.srcIn)
                      : ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
            ),
            label: 'Account',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 1,
      ),
      body: SafeArea(
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
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
