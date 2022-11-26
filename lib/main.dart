import 'package:cleanzo/screens/HomePage.dart';
import 'package:cleanzo/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleanzo',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
        primaryColor: const Color.fromARGB(255, 92, 198, 240),
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
