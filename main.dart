import 'package:projeto_contador/main.dart';
import 'package:flutter/material.dart';
import './homepage.dart';

main() {
  runApp(ContadorApp());
}

@override
class ContadorApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tira o debug no canto da tela
      home: homepage(),
    );
  }
}
