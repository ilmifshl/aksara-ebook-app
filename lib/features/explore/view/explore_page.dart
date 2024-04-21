import 'package:aksara_ebook_apps/routes/router.dart';
import 'package:aksara_ebook_apps/shared/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/bloc/bloc.dart';
import 'package:aksara_ebook_apps/model/book.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _keyword = '';
  bool _showSearch = false;

  @override
  void initState() {
    bookBloc.fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showSearch ? _buildSearchField(context) : _buildTitle(),
        actions: _showSearch ? [_buildCloseSearchFieldButton()] : null,
      ),
      body: StreamBuilder<List<Book>>(
        stream: bookBloc.booksStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Book> books = snapshot.data ?? [];
            List<Book> filteredBooks = books;
            final int numberOfColumns = 3; // Number of columns
            final double rowHeight = 240.5; // Height of each row
            final int numberOfItems = filteredBooks.length;
            final int numberOfRows = (numberOfItems / numberOfColumns)
                .ceil(); // Calculate the number of rows
            final double dynamicHeight =
                numberOfRows * rowHeight; // Calculate the dynamic height

            if (_keyword.isNotEmpty) {
              filteredBooks = books
                  .where((book) =>
                      book.title.toLowerCase().contains(_keyword.toLowerCase()))
                  .toList();
            }

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
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return _buildBookCard(book);
                },
              ),
            );
          }
        },
      ),
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

  Widget _buildTitle() {
    return Row(
      children: [
        Expanded(child: Text('Explore Book')),
        IconButton(
          onPressed: () {
            setState(() {
              _showSearch = true;
            });
          },
          icon: Icon(Iconsax.search_normal),
          padding: EdgeInsets.zero,
        )
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(hintText: 'Search...', border: InputBorder.none),
      onChanged: (value) {
        setState(() {
          _keyword = value;
        });
      },
      onSubmitted: (value) {
        setState(() {
          _showSearch = false;
        });
      },
    );
  }

  Widget _buildCloseSearchFieldButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            _showSearch = false;
          });
        },
        icon: Icon(Iconsax.close_square));
  }
}
