
import 'package:consuming_api/presentation/another_page.dart';
import 'package:consuming_api/presentation/book_page.dart';
import 'package:consuming_api/provider/example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  @override
  void initState() {
    
    super.initState();
   Provider.of<ExampleProvider>(context, listen: false).fetchExamples();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consuming API'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AnotherPage()));
          }, icon: Icon(Icons.difference)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookPage()));
          }, icon: Icon(Icons.book)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Example'),
            Consumer<ExampleProvider>(
              builder: (context, exampleProvider, child) {
                if (exampleProvider.examples.isEmpty) {
                  return const CircularProgressIndicator(); // Muestra el loading
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: exampleProvider.examples.length,
                      itemBuilder: (context, index) {
                        final exampleModel = exampleProvider.examples[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent, // Fondo del ListTile
                            borderRadius: BorderRadius.circular(10), // Bordes redondeados
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.view_agenda, color: Colors.white), // Icono de la lista
                            title: Text(
                              exampleModel.title,
                              style: const TextStyle(color: Colors.white), // Texto blanco para contraste
                            ),
                            subtitle: Text(
                              'ID: ${exampleModel.id}',
                              style: const TextStyle(color: Colors.white),
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
      ),
    );
  }
}
