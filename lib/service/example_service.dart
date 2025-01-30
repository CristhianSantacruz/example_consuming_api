import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:consuming_api/model/example_model.dart';

class ExampleService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final dio= Dio();
  
 Future<List<ExampleModel>> getExamples() async {
  final response = await http.get(Uri.parse('$baseUrl/albums'));
  if (response.statusCode == 200) {
    // Decodificar la respuesta como una lista de objetos
    List<dynamic> body = jsonDecode(response.body);
    return body.map((item) => ExampleModel.fromJson(item)).toList(); // Mapea cada item de la lista a un ExampleModel
  } else {
    throw Exception('Failed to load examples');
  }
}


  Future<ExampleModel> getExample(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/albums/$id'));
    if (response.statusCode == 200) {
      return ExampleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load example');
    }
  }
}