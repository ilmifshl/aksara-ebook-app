import 'package:aksara_ebook_apps/bloc/bloc.dart';
import 'package:aksara_ebook_apps/database/book_store_database.dart';
import 'package:aksara_ebook_apps/model/cart_item.dart';
import 'package:aksara_ebook_apps/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/model/book.dart';
import 'package:aksara_ebook_apps/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aksara_ebook_apps/shared/color_values.dart';
import 'package:aksara_ebook_apps/shared/styles.dart';
import 'package:aksara_ebook_apps/widgets/custom_text_field.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/percent_indicator.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> genres = <String>[
    'Semua',
    'Fiksi',
    'Non fiksi',
    'Novel',
    'Komik'
  ];

  @override
  void initState() {
    super.initState();
    _getInitData();
  }

  @override
  void dispose() {
    super.dispose();
    bookBloc.dispose();
  }

  Future<void> _getInitData() async {
    await bookBloc.insertBook();
    bookBloc.fetchBooks();
  }

  Widget build(BuildContext context) {
    return Container(
      color: ColorValues.backgroundGrey,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBarContentWidget(),
            Padding(
              padding: const EdgeInsets.all(2),
            ),
            // _buildContinueReading(),
            // const SizedBox(
            //   height: Styles.defaultPadding,
            // ),
            _buildBooksByGenre(),
            _buildBooks(),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

  Widget _buildTopBarContentWidget() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          right: Styles.defaultPadding,
          left: Styles.defaultPadding,
          top: Styles.biggerPadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Halo Taufiq,',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Buku apa yang ingin kamu baca?',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('lib/assets/profile_pict.jpg'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueReading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lanjut Baca',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Selengkapnya',
                style: TextStyle(fontSize: 14, color: ColorValues.primary50),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _buildContinueReadingContent(),
        ],
      ),
    );
  }

  Widget _buildContinueReadingContent() {
    return Container(
      padding: const EdgeInsets.all(Styles.defaultPadding),
      height: 130,
      decoration: BoxDecoration(
          color: ColorValues.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage('lib/assets/book_cover_1.png'),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Will Never Found You',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Oleh Matt Zhang',
                    style:  context.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Halaman 51 dari 127',
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  LinearPercentIndicator(
                    width: 200,
                    lineHeight: 6,
                    percent: 0.3,
                    progressColor: ColorValues.primary40,
                    animation: true,
                    animationDuration: 2500,
                    barRadius: const Radius.circular(20),
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                  )
                ],
              )),
          const IconButton(
              onPressed: null,
              icon: Icon(
                Iconsax.arrow_right_3,
                color: ColorValues.grey80,
                size: 32,
              ))
        ],
      ),
    );
  }

  Widget _buildBooksByGenre() {
    return Container(
      padding: const EdgeInsets.all(Styles.defaultPadding),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    String selectedGenre = genres[index];
                    if (selectedGenre == 'Semua') {
                      bookBloc.fetchBooks();
                    } else {
                      bookBloc.filterBooksByGenre(selectedGenre);
                    }
                  });
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? ColorValues.primary50
                        : ColorValues.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: ColorValues.primary50,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${genres[index]}',
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? ColorValues.white
                            : ColorValues.primary50,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildBooks() {
    return StreamBuilder<List<Book>>(
      stream: bookBloc.booksStream,
      builder: (context, snapshot) {
        debugPrint('snapshot ${snapshot.connectionState.name}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Book> books = snapshot.data ?? [];
          final int numberOfColumns = 3; // Number of columns
          final double rowHeight = 240.5; // Height of each row
          final int numberOfItems = books.length;
          final int numberOfRows = (numberOfItems / numberOfColumns).ceil(); // Calculate the number of rows
          final double dynamicHeight = numberOfRows * rowHeight; // Calculate the dynamic height
          return SizedBox(
            height: dynamicHeight,
            child: GridView.builder(
              padding: EdgeInsets.all(4),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 books per row
                mainAxisSpacing: 4,
                crossAxisSpacing: 0,
                childAspectRatio: 0.8,
                mainAxisExtent: 240.5,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return _buildBookCard(book);
              },
            ),
          );
        }
      },
    );
  }


  Widget _buildBookCard(Book book) {
    return GestureDetector(
      onTap: () {
        context.router.push(DetailbookRoute(book: book));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                book.cover,
                width: 100,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
