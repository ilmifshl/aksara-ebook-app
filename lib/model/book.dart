class Book {
  final int? id;
  final String title;
  final String author;
  final String genre;
  final double price;
  final int rating;
  final String cover;
  final String language;
  final int totalReview;
  final String description;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.price,
    required this.rating,
    required this.cover,
    required this.language,
    required this.totalReview,
    required this.description,
  });

  static const String tableBooks = 'books';

  static Book fromMap(Map<String, dynamic> map) {
    return Book(
      // id: map[BookFields.id],
      title: map[BookFields.title],
      author: map[BookFields.author],
      genre: map[BookFields.genre],
      price: map[BookFields.price],
      rating: map[BookFields.rating],
      cover: map[BookFields.cover],
      language: map[BookFields.language],
      totalReview: map[BookFields.totalReview],
      description: map[BookFields.description],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // BookFields.id: id,
      BookFields.title: title,
      BookFields.author: author,
      BookFields.genre: genre,
      BookFields.price: price,
      BookFields.rating: rating,
      BookFields.cover: cover,
      BookFields.language: language,
      BookFields.totalReview: totalReview,
      BookFields.description: description,
    };
  }
}

class BookFields {
  static const id = 'id';
  static const title = 'title';
  static const author = 'author';
  static const genre = 'genre';
  static const price = 'price';
  static const rating = 'rating';
  static const cover = 'cover';
  static const language = 'language';
  static const totalReview = 'total_review';
  static const description = 'description';
}
