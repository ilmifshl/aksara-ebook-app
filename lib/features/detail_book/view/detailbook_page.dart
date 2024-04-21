import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/bloc/cart_bloc.dart';
import 'package:aksara_ebook_apps/database/book_store_database.dart';
import 'package:aksara_ebook_apps/model/cart_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aksara_ebook_apps/shared/color_values.dart';
import 'package:aksara_ebook_apps/model/book.dart';
import 'package:aksara_ebook_apps/routes/router.dart';
import 'package:aksara_ebook_apps/shared/styles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

@RoutePage()
class DetailbookPage extends StatefulWidget {
  const DetailbookPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  _DetailbookPageState createState() => _DetailbookPageState();
}

class _DetailbookPageState extends State<DetailbookPage> {
  late List<CartItem> _cart = [];

  @override
  void initState() {
    super.initState();
    _refreshCart();
  }

  Future<void> _refreshCart() async {
    final cartItems = await BookStoreDatabase.instance.getAllCartItems();
    setState(() {
      _cart = cartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValues.backgroundGrey,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildBookCover(),
                Positioned(
                  top: 12,
                  left: 24,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Iconsax.arrow_square_left5,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -45,
                  left: 0,
                  right: 0,
                  child: _buildBookDetails(),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Sinopsis',
                      style: GoogleFonts.plusJakartaSans(
                        color: ColorValues.grey70,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  _buildBookDescriptionWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildAddToCartWidget(),
    );
  }

  Widget _buildAddToCartWidget() {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    String formattedPrice = formatter.format(widget.book.price);

    return Container(
      margin: EdgeInsets.only(
        right: Styles.defaultPadding,
        left: Styles.defaultPadding,
        bottom: Styles.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: ColorValues.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Styles.defaultPadding,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              formattedPrice,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final cartItem = CartItem(
                book: widget.book,
              );
              print(cartItem.book.title);
              cartBloc.insertCartItem(cartItem);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Book added to cart'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(ColorValues.primary50),
            ),
            child: Text(
              'Add to Cart',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCover() {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.book.cover),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          alignment: AlignmentDirectional.center,
          child: Column(
            children: [
              SizedBox(height: 36),
              Image.asset(
                widget.book.cover,
                width: 150,
              ),
              SizedBox(height: 16),
              Text(
                widget.book.title,
                style: TextStyle(
                  color: ColorValues.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'by ${widget.book.author}',
                style: TextStyle(
                  color: ColorValues.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookDescriptionWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Text(
        widget.book.description,
        textAlign: TextAlign.justify,
        style: GoogleFonts.plusJakartaSans(
          color: ColorValues.grey70,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildBookDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Styles.bigPadding),
      decoration: BoxDecoration(
        color: ColorValues.white,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Styles.defaultPadding,
        vertical: Styles.defaultPadding / 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDetailInfo('Rating', '⭐ ${widget.book.rating}/5'),
          _buildDetailInfo('Pages', widget.book.totalReview.toString()),
          _buildDetailInfo('Language', widget.book.language),
        ],
      ),
    );
  }

  Widget _buildDetailInfo(String label, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            color: ColorValues.grey60,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            color: ColorValues.grey90,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
