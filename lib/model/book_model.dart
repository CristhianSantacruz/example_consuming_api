import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
    final String id;
    final String title;
    final String author;
    final String year;
    final String description;

    BookModel({
        required this.id,
        required this.title,
        required this.author,
        required this.year,
        required this.description,
    });

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        year: json["year"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "year": year,
        "description": description,
    };
}
