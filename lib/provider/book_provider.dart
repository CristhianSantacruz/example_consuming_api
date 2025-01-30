import 'package:consuming_api/model/book_model.dart';
import 'package:consuming_api/service/book_service.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier{
  List<BookModel> _books = [];
  final BookService _bookService = BookService();
  List<BookModel> get books => _books;

  void fetchBooks() async  {
    _books =  await _bookService.getBooks();
    notifyListeners();
  }

  void deleteBook(String id) async  {
    await _bookService.deleteBook(id);
    fetchBooks();
  }
}