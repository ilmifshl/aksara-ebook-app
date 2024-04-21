import 'package:aksara_ebook_apps/database/book_store_database.dart';
import 'package:aksara_ebook_apps/model/book.dart';

Future<void> insertSampleData() async {
  final database = BookStoreDatabase.instance;

  try {
    final books = await database.getAllBooks();
    if (books.isEmpty) {
      await database.insertBook(Book(
        title: 'Will Never Found You',
        author: 'Olivia Wilson',
        genre: 'Fiksi',
        price: 100000,
        rating: 4,
        cover: 'lib/assets/book_cover_1.png',
        language: 'IDN',
        totalReview: 100,
        description:
        'Di tepi pantai yang sunyi terletak sebuah pulau terlupakan yang dipenuhi dengan misteri dan rahasia. Ketika sekelompok anak muda petualang memutuskan untuk menjelajahi pulau tersebut, mereka tanpa sengaja mengungkap sebuah teka-teki kuno yang telah tersembunyi selama berabad-abad. Dengan petunjuk yang tersebar di sepanjang reruntuhan purba, para petualang harus memecahkan misteri tersebut sebelum mereka jatuh ke dalam bahaya yang tak terbayangkan. Namun, semakin mereka mendekati kebenaran, semakin gelap rahasia yang terkandung di balik pulau terlupakan itu.',
      ));

      await database.insertBook(Book(
        title: 'Hide and Seek',
        author: 'Olivia Wilson',
        genre: 'Non fiksi',
        price: 78000,
        rating: 3,
        cover: 'lib/assets/book_cover_2.png',
        language: 'ENG',
        totalReview: 50,
        description:
        'Dalam perjalanan yang menantang melintasi gurun yang tak berujung, seorang penjelajah bernama Arya menemukan peta kuno yang menggambarkan rute menuju kota legendaris yang dikabarkan hilang di antara pasir. Dengan tekad yang kuat dan hasrat untuk menemukan kebenaran, Arya memimpin ekspedisi yang berani menelusuri jejak-jejak masa lalu yang terlupakan. Namun, di tengah jalan, mereka harus berhadapan dengan berbagai rintangan dan musuh yang menghalangi mereka untuk mencapai tujuan. Dengan setiap langkah, Arya dan kawan-kawan menyadari bahwa petualangan mereka bukan hanya tentang menemukan kota yang hilang, tetapi juga tentang menemukan jati diri dan tujuan sejati mereka dalam kehidupan.',
      ));

      await database.insertBook(Book(
        title: 'The Invisible Man',
        author: 'Olivia Wilson',
        genre: 'Novel',
        price: 246000,
        rating: 5,
        cover: 'lib/assets/book_cover_3.png',
        language: 'ENG',
        totalReview: 200,
        description:
        'Di tepi pantai yang sunyi terletak sebuah pulau terlupakan yang dipenuhi dengan misteri dan rahasia. Ketika sekelompok anak muda petualang memutuskan untuk menjelajahi pulau tersebut, mereka tanpa sengaja mengungkap sebuah teka-teki kuno yang telah tersembunyi selama berabad-abad. Dengan petunjuk yang tersebar di sepanjang reruntuhan purba, para petualang harus memecahkan misteri tersebut sebelum mereka jatuh ke dalam bahaya yang tak terbayangkan. Namun, semakin mereka mendekati kebenaran, semakin gelap rahasia yang terkandung di balik pulau terlupakan itu.',
      ));

      await database.insertBook(Book(
        title: 'Soul',
        author: 'Olivia Wilson',
        genre: 'Komik',
        price: 41000,
        rating: 4,
        cover: 'lib/assets/book_cover_4.png',
        language: 'IDN',
        totalReview: 80,
        description:
        'Di tepi pantai yang sunyi terletak sebuah pulau terlupakan yang dipenuhi dengan misteri dan rahasia. Ketika sekelompok anak muda petualang memutuskan untuk menjelajahi pulau tersebut, mereka tanpa sengaja mengungkap sebuah teka-teki kuno yang telah tersembunyi selama berabad-abad. Dengan petunjuk yang tersebar di sepanjang reruntuhan purba, para petualang harus memecahkan misteri tersebut sebelum mereka jatuh ke dalam bahaya yang tak terbayangkan. Namun, semakin mereka mendekati kebenaran, semakin gelap rahasia yang terkandung di balik pulau terlupakan itu.',
      ));

      print('Sample data inserted successfully');
    } else {
      print('Sample data already exists');
    }
  } catch (e) {
    print('Error inserting sample data: $e');
  }
}
