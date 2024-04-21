import 'package:aksara_ebook_apps/model/book.dart';
import 'package:aksara_ebook_apps/model/cart_item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookStoreDatabase {
  static final BookStoreDatabase instance = BookStoreDatabase._init();

  BookStoreDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase('book_store.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const sql = '''
    CREATE TABLE ${Book.tableBooks}(
      ${BookFields.id} INTEGER PRIMARY KEY, 
      ${BookFields.title} TEXT, 
      ${BookFields.author} TEXT, 
      ${BookFields.genre} TEXT, 
      ${BookFields.price} DOUBLE,
      ${BookFields.rating} INTEGER,
      ${BookFields.cover} TEXT,
      ${BookFields.language} TEXT,
      ${BookFields.totalReview} INTEGER,
      ${BookFields.description} TEXT
    );
  ''';

    const sql2 = '''
    CREATE TABLE ${CartItem.tableCartItems}(
      ${CartItemFields.id} INTEGER PRIMARY KEY, 
      ${CartItemFields.bookId} INTEGER, 
      ${CartItemFields.title} TEXT,
      ${CartItemFields.author} TEXT,
      ${CartItemFields.genre} TEXT,
      ${CartItemFields.cover} TEXT,
      ${CartItemFields.price} DOUBLE,
      ${CartItemFields.description} TEXT,
      ${CartItemFields.language} TEXT,
      ${CartItemFields.totalReview} INTEGER,
      ${CartItemFields.rating} INTEGER,
      FOREIGN KEY(${CartItemFields.bookId}) REFERENCES ${Book.tableBooks}(${BookFields.id}) ON DELETE CASCADE
    );
  ''';

    try {
      await db.execute(sql);
      await db.execute(sql2);
    } catch (e) {
      print('Error creating tables: $e');
      throw e;
    }
  }



  Future<void> insertBook(Book book) async {
    final db = await instance.database;
    await db.insert(Book.tableBooks, book.toMap());
  }

  Future<void> insertCartItem(CartItem cartItem) async {
    final db = await instance.database;
    // Include all fields in toMap if required by your application
    await db.insert(CartItem.tableCartItems, cartItem.toMap());
    print('test cart item ${cartItem.toMap()}');
  }

  Future<Book?> getBookById(int id) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      Book.tableBooks,
      where: '${BookFields.id} = ?',
      whereArgs: [id],
      limit: 1, // Limit the result to one item
    );

    if (result.isNotEmpty) {
      return Book.fromMap(result.first);
    } else {
      return null; // Return null if no book found with the given ID
    }
  }


  Future<List<Book>> getAllBooks() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(Book.tableBooks);
    return result.map((map) => Book.fromMap(map)).toList();
  }

  Future<List<CartItem>> getAllCartItems() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(CartItem.tableCartItems);
    return result.map((map) {
      print('cart item $map');
      return CartItem.fromMap(map);
    }).toList();

  }

  Future<void> deleteCartItem(int id) async {
    final db = await instance.database;
    await db.delete(
      CartItem.tableCartItems,
      where: '${CartItemFields.id} = ?',
      whereArgs: [id],
    );
  }
  Future<void> deleteCart() async {
    final db = await instance.database;
    await db.delete(
      CartItem.tableCartItems,
    );
  }

  Future<List<Book>> getBooksByGenre(String genre) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      Book.tableBooks,
      where: '${BookFields.genre} = ?',
      whereArgs: [genre],
    );

    return List.generate(maps.length, (i) {
      return Book(
        id: maps[i]['id'],
        title: maps[i]['title'],
        author: maps[i]['author'],
        genre: maps[i]['genre'],
        cover: maps[i]['cover'],
        price: maps[i]['price'] ?? 0, // Handle nilai null dengan memberikan nilai default
        description: maps[i]['description'] ?? '',
        language: maps[i]['language'] ?? '',
        totalReview: maps[i]['totalReview'] ?? 0,
        rating: maps[i]['rating'] ?? 0,
      );
    });
  }

}
