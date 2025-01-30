import 'package:flutter/material.dart';


class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Page'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.bottomLeft,child: const Text("Todos los libros",style: TextStyle(fontSize: 20,color: Colors.black),)),
          )

          
        ],
      ),
    );
  }
}