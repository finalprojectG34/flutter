class Cart {
  const Cart(
      {this.id, this.name, this.price, this.amount, this.shopId, this.image});

  final String? id;
  final String? name;
  final String? price;
  final String? amount;
  final String? shopId;
  final String? image;

  factory Cart.fromJson(Map<String, dynamic> json) {
    Cart item = Cart(
        id: json['id'],
        name: json['name'],
        price: json['price']['sale'].toString(),
        amount: "1",
        shopId: json['shopId'],
        image: json['image']['imageCover']);
    return item;
  }

  @override
  String toString() {
    return '{id: $id name: $name price: $price}';
  }
}
