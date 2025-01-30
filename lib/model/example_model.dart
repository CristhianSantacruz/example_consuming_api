import 'dart:convert';

ExampleModel exampleModelFromJson(String str) => ExampleModel.fromJson(json.decode(str));

String exampleModelToJson(ExampleModel data) => json.encode(data.toJson());

class ExampleModel {
    final int userId;
    final int id;
    final String title;

    ExampleModel({
        required this.userId,
        required this.id,
        required this.title,
    });

    factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}
