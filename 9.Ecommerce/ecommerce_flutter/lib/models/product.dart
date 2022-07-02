// Create a Model
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Because Firebase needs a json file, we use Map
  // to get it done
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Firebase return a Json file so we need to
  // make it a Product file.
  Product.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? "",
        description = map['description'] ?? "",
        price = map['price'] ?? 0.0,
        imageUrl = map['imageUrl'] ?? "";
}
