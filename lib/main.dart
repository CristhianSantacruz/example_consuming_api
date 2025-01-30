import 'package:consuming_api/presentation/home_page.dart';
import 'package:consuming_api/provider/book_provider.dart';
import 'package:consuming_api/provider/example_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ExampleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      locale: Locale('es','ES'),
      supportedLocales:  [
        Locale('en','US'),
        Locale('es','ES'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,
      ],
      home: HomePage(),
    );
  }
}
