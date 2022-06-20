class Cart {
  const Cart({
    this.id,
    this.name,
    this.price,
    this.amount,
    this.shopId,
  });

  final String? id;
  final String? name;
  final String? price;
  final String? amount;
  final String? shopId;

  factory Cart.fromJson(Map<String, dynamic> json) {
    Cart item = Cart(
      id: json['id'],
      name: json['name'],
      price: json['price']['sale'].toString(),
      amount: "1",
      shopId: json['shopId'],
    );
    return item;
  }

  @override
  String toString() {
    return '{id: $id name: $name price: $price}';
  }
}
