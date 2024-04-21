import 'dart:async';
import 'package:aksara_ebook_apps/database/book_store_database.dart';
import 'package:aksara_ebook_apps/model/cart_item.dart';

class CartBloc {

  final _cartController = StreamController<List<CartItem>>.broadcast();

  Stream<List<CartItem>> get cartStream => _cartController.stream;

  void fetchCartItems() async {
    List<CartItem> cartItems = await BookStoreDatabase.instance.getAllCartItems();
    _cartController.sink.add(cartItems);
  }

  void insertCartItem(CartItem cartItem) async {
    await BookStoreDatabase.instance.insertCartItem(cartItem);
    fetchCartItems(); // Refresh the cart after insertion
  }

  Future<int> getCartItemsLength() async {
    List<CartItem> cartItems = await BookStoreDatabase.instance.getAllCartItems();
    return cartItems.length;
  }

  void deleteCartItem(int id) async {
    await BookStoreDatabase.instance.deleteCartItem(id);
    fetchCartItems(); // Refresh the cart after deletion
  }

  void deleteCart() async {
    await BookStoreDatabase.instance.deleteCart();
    fetchCartItems(); // Refresh the cart after deletion
  }

  void dispose() {
    _cartController.close();
  }
}

final cartBloc = CartBloc();