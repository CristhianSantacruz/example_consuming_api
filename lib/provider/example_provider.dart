import 'package:consuming_api/model/example_model.dart';
import 'package:consuming_api/service/example_service.dart';
import 'package:flutter/material.dart';

class ExampleProvider extends ChangeNotifier{
  List<ExampleModel> _examples = [];
  final ExampleService _exampleService = ExampleService();
  List<ExampleModel> get examples => _examples;

  void fetchExamples() async  {
    _examples =  await _exampleService.getExamples();
    notifyListeners();
  }
}