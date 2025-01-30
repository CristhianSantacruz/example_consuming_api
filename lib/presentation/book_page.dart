import 'package:consuming_api/model/book_model.dart';
import 'package:consuming_api/provider/book_provider.dart';
import 'package:consuming_api/service/book_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BookProvider>(context, listen: false).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bookProviderWatch = context.watch<BookProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Book Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Todos los libros",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ),
          Consumer<BookProvider>(
            builder: (context, bookProvider, child) {
              if (bookProvider.books.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(), // Muestra el loading
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: bookProvider.books.length,
                    itemBuilder: (context, index) {
                      final book = bookProvider.books[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors.onPrimary),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(book.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("${book.author} | ${book.year}"),
                                    Text(book.description),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            bookProviderWatch
                                                .deleteBook(book.id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // Usa el método del Provider para editar
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Datos  de los libros");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
