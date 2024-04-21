import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/bloc/cart_bloc.dart';
import 'package:aksara_ebook_apps/model/cart_item.dart';
import 'package:auto_route/annotations.dart';
import 'package:aksara_ebook_apps/shared/color_values.dart';
import 'package:aksara_ebook_apps/shared/styles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    cartBloc.fetchCartItems(); // Get cart data when page is loaded
  }

  @override
  void dispose() {
    cartBloc.dispose(); // Make sure to dispose bloc when page is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.backgroundGrey,
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder<List<CartItem>>(
        stream: cartBloc.cartStream, // Use bloc stream to get cart data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<CartItem> cartItems = snapshot.data ?? [];
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(cartItems[index]);
              },
            );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(Styles.defaultPadding),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            onPressed: () {
              cartBloc.deleteCart();
            },
            label: Text(
              'Check Out',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Iconsax.shopping_bag, color: Colors.white),
            backgroundColor: ColorValues.primary50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCartItem(CartItem cartItem) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    String formattedPrice = formatter.format(cartItem.book.price);

    return Container(
      margin: EdgeInsets.all(Styles.defaultPadding),
      padding: EdgeInsets.all(Styles.defaultPadding),
      decoration: BoxDecoration(
        color: ColorValues.white,
        borderRadius: BorderRadius.circular(12), // Add border radius for a better look
      ),
      child: Row(
        children: [
          Image.asset(
            cartItem.book.cover,
            height: 100,
          ),
          SizedBox(width: 12), // Add spacing between image and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cartItem.book.title}',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  '${cartItem.book.author}',
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorValues.grey30,
                  ),
                ),
                SizedBox(height: 8),
                _buildRatingStars(cartItem.book.rating),
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Align items to the end
              children: [
                IconButton(
                  onPressed: () {
                    // cartBloc.deleteCartItem(cartItem.id); // Delete cart item
                  },
                  icon: Icon(Iconsax.trash),
                  color: ColorValues.danger50,
                ),
                SizedBox(height: 28), // Adjust spacing between icon and text
                Text(
                  formattedPrice,
                  style: TextStyle(fontSize: 14),
                ), // Format price as currency
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(int rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(Expanded(child: Icon(Iconsax.star1, color: ColorValues.star)));
      } else {
        stars.add(Expanded(child: Icon(Iconsax.star1, color: ColorValues.grey60)));
      }
    }
    return Row(
      children: stars,
    );
  }
}
