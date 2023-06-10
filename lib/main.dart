import 'package:flutter/material.dart';
import 'package:institutocana/paginas/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instituto Caná',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          backgroundColor: Colors.blueGrey.shade50,
          primarySwatch: Colors.green,
          accentColor: Colors.green.shade300,
          cardColor: Colors.green.shade300,
          errorColor: Colors.red,
        ),
        useMaterial3: true,
      ),
    );
  }
}
