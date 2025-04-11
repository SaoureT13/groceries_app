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

class Product {
  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  String name;
  String description;
  double price;
  String image;
  String category;
}

List<Product> generateProducts() {
  return products.map((product) {
    return Product(
      name: product["name"],
      image: product["image"],
      description: product["description"],
      category: product["category"],
      price: product["price"],
    );
  }).toList();
}
