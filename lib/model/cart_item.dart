import 'package:aksara_ebook_apps/model/book.dart';

class CartItem {
  final int? id;
  final Book book;

  CartItem({
    this.id,
    required this.book,
  });

  static const String tableCartItems = 'cartItems';

  Map<String, dynamic> toMap() {
    return {
      CartItemFields.title: book.title,
      CartItemFields.author: book.author,
      CartItemFields.genre: book.genre,
      CartItemFields.cover: book.cover,
      CartItemFields.price: book.price,
      CartItemFields.description: book.description,
      CartItemFields.language: book.language,
      CartItemFields.totalReview: book.totalReview,
      CartItemFields.rating: book.rating,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
        book: Book(
            title: map['title'],
            author: map['author'],
            genre: map['genre'],
            price: map['price'],
            rating: map['rating'],
            cover: map['cover'],
            language: map['language'],
            totalReview: map['totalReview'],
            description: map['description']));
  }
}

class CartItemFields {
  static const String id = 'id';
  static const String bookId = 'bookId';
  static const String title = 'title';
  static const String author = 'author';
  static const String genre = 'genre';
  static const String cover = 'cover';
  static const String price = 'price';
  static const String description = 'description';
  static const String language = 'language';
  static const String totalReview = 'totalReview';
  static const String rating = 'rating';
}
