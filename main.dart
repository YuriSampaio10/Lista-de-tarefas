import 'package:flutter/material.dart';
import 'pages/toDo_list_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tira o debug no canto da tela
      home: toDolistPage(),
    );
  }
}
