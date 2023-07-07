class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String category;
  // final String rating;
  final double rate;
  final int count;
  Product({required this.id, required this.title, required this.price, required this.image, required this.description, required this.category, required this.rate, required this.count});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'],
      category: json['category'],

      rate: json['rating']['rate'].toDouble(),
      count: json['rating']['count'],
    );
  }
}
