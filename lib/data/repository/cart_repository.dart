import '../../src/app.dart';
import '../data_access/cart_data_access.dart';

class CartRepository {
  final CartDataAccess cartDataAccess;

  CartRepository({required this.cartDataAccess});

  Future<List<Cart>> getCart() async {
    return cartDataAccess.getCart();
  }

  Future addToCart(Cart cart) async {
    await cartDataAccess.addToCart(cart);
  }

  Future deleteCart(String cartId) async {
    await cartDataAccess.deleteCart(cartId);
  }
}
