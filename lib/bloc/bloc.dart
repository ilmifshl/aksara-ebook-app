import 'dart:async';
import 'package:aksara_ebook_apps/database/book_store_database.dart';
import 'package:aksara_ebook_apps/model/book.dart';
import 'package:aksara_ebook_apps/model/insert_book.dart';

class BookBloc {
  final _booksController = StreamController<List<Book>>.broadcast();

  Stream<List<Book>> get booksStream => _booksController.stream;

  Future<void> fetchBooks() async {
    List<Book> books = await BookStoreDatabase.instance.getAllBooks();
    _booksController.sink.add(books);
  }

  Future<void> insertBook() async {
    await insertSampleData();
    await fetchBooks(); // Refresh the list after insertion
  }

  void filterBooksByGenre(String genre) async {
    List<Book> books = await BookStoreDatabase.instance.getBooksByGenre(genre);
    _booksController.sink.add(books);
  }

  void dispose() {
    _booksController.close();
  }
}

final bookBloc = BookBloc();
