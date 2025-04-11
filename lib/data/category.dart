final List<Map<String, dynamic>> categories = [
  {
    "title": "Fresh Fruits & Vegetable",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#53B175",
  },
  {
    "title": "Dairy Products",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFF5E6",
  },
  {
    "title": "Bakery & Snacks",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFE6E6",
  },
  {
    "title": "Meat & Fish",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFE6F0FF",
  },
  {
    "title": "Beverages",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFEAF4FF",
  },
  {
    "title": "Canned Foods",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFF0F5",
  },
  {
    "title": "Baby Products",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFF0FFF0",
  },
  {
    "title": "Household Items",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFFAE6",
  },
  {
    "title": "Frozen Foods",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFE6FFFF",
  },
  {
    "title": "Health & Wellness",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFF9E6FF",
  },
  {
    "title": "Personal Care",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFF0F8FF",
  },
  {
    "title": "Cooking Essentials",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFFDE6",
  },
  {
    "title": "Organic Products",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFE6FFE6",
  },
  {
    "title": "Pet Supplies",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFE6F7",
  },
  {
    "title": "Condiments & Spices",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFF0E6",
  },
  {
    "title": "Grains & Pulses",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFF5FFF0",
  },
  {
    "title": "Cleaning Supplies",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFE6F7FF",
  },
  {
    "title": "Stationery",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFF0FF",
  },
  {
    "title": "Breakfast Items",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFE6FFF9",
  },
  {
    "title": "Ready to Eat",
    "image": "assets/images/fruits_vegetables_image.png",
    "color": "#FFFFEDE6",
  },
];

class Category {
  Category({
    required this.title,
    required this.image,
    required this.color,
  });

  String title;
  String image;
  String color;
}

List<Category> generateCategory() {
  return categories.map((category) {
    return Category(
      title: category["title"],
      image: category["image"],
      color: category["color"],
    );
  }).toList();
}
