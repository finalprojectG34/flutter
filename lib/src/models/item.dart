class Item {
  const Item({
    this.id,
    this.name,
    this.price,
    this.category,
    this.imagePath,
    this.description,
  });

  final String? id;
  final String? name;
  final String? price;
  final String? category;
  final String? imagePath;
  final String? description;

  factory Item.fromJson(Map<String, dynamic> json) {
    Item item = Item(
      id: json['id'],
      name: json['name'],
      price: json['price'].toString(),
      category: json['category'],
      imagePath: json['image'],
      description: json['desc'],
    );
    return item;
  }

  @override
  String toString() {
    return '{id: $id name $name price $price category $category imagePath $imagePath description $description}';
  }
}
