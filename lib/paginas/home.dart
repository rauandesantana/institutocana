import 'package:flutter/material.dart';
import 'package:institutocana/componentes/app_bar/app_bar_button.dart';
import 'package:institutocana/componentes/app_bar/app_bar_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final smallMode = largura < 450;

    return Scaffold(
      appBar: AppBarCustom(
        context: context,
        actions: <Widget>[
          AppBarButton(
            context: context,
            smallMode: smallMode,
            icon: Icons.login_outlined,
            title: "Entrar",
            onPressed: () {},
          ),
          const Padding(padding: EdgeInsets.only(right: 10)),
          AppBarButton(
            context: context,
            smallMode: smallMode,
            icon: Icons.person_add_rounded,
            title: "Cadastrar",
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("data")
          ],
        ),
      ),
    );
  }
}
