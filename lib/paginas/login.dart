import 'package:flutter/material.dart';
import 'package:institutocana/componentes/app_bar/app_bar_button.dart';
import 'package:institutocana/componentes/app_bar/app_bar_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    void signUp() => Navigator.of(context).popAndPushNamed("/cadastrar");

    return Scaffold(
      appBar: AppBarCustom(
        context: context,
        actions: <Widget>[
          AppBarButton(
            context: context,
            icon: Icons.person_add_rounded,
            title: "Cadastrar",
            onPressed: () => signUp(),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {

          return SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth,
              child: Column(
                children: <Widget>[

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
