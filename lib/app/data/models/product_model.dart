class Product {
  late String name;
  late String description;
  late String image;
  late String price;

  Product.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    description = map['description'];
    image = map['image'];
    price = map['price'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "image": image,
      "price": price,
    };
  }
}
