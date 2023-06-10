import 'package:flutter/material.dart';
import 'package:institutocana/componentes/app_bar/app_bar_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context: context,
        actions: const <Widget>[],
      ),
      body: Container(),
    );
  }
}
