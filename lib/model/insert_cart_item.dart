import 'package:aksara_ebook_apps/database/book_store_database.dart';
import 'package:aksara_ebook_apps/model/book.dart';
import 'package:aksara_ebook_apps/model/cart_item.dart';

void insertCartItem(Book book) async {
  final database = BookStoreDatabase.instance;

  try {
    await database.database; // Memastikan bahwa database telah diinisialisasi
    await database.insertCartItem(CartItem(
        book: book
    ));

    print('Sample data inserted successfully');
  } catch (e) {
    print('Error inserting sample data: $e');
  }
}
