import 'package:flutter/material.dart';
import 'package:institutocana/componentes/app_bar/app_bar_button.dart';
import 'package:institutocana/componentes/app_bar/app_bar_custom.dart';
import 'package:institutocana/componentes/banner_home/banner_home.dart';
import 'package:institutocana/componentes/slider_banner/slider_banner.dart';
import 'package:institutocana/componentes/text_title/text_title.dart';

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
        child: SizedBox(
          width: largura,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const BannerHome(),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextTitle(context: context, title: "Cursos"),
              ),
              SliderBanner(
                itemBuilder: (context, index) {
                  return Text(index.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
