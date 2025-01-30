import 'package:consuming_api/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
class BookService {
  final Dio _dio = Dio(); // Instancia de Dio
  final String baseUrl = 'http://192.168.31.102:7070/api/book';

  Future<List<BookModel>> getBooks() async {
    try {
      final response = await _dio.get('$baseUrl/all');

      if (response.statusCode == 200) {
        // Decodificar la respuesta como una lista de objetos
        List<dynamic> body = response.data; // Dio ya decodifica el JSON automáticamente
        return body.map((item) => BookModel.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load books. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Manejo de errores específicos de Dio
      throw Exception('Failed to load books: ${e.message}');
    }
  }

  Future<bool> deleteBook(String id) async {
    try {
      final response = await _dio.delete('$baseUrl/delete/$id');

      if (response.statusCode == 200) {
        debugPrint("Se eliminó correctamente el libro");
        return response.data ==
            'true'; // Asume que el backend devuelve 'true' como respuesta
      } else {
        debugPrint("No se eliminó correctamente el libro");
        throw Exception(
            'Failed to delete book. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Manejo de errores específicos de Dio
      throw Exception('Failed to delete book: ${e.message}');
    }
  }
}
