import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:institutocana/componentes/app_bar/app_bar_button.dart';
import 'package:institutocana/componentes/app_bar/app_bar_custom.dart';
import 'package:institutocana/componentes/banner_home/banner_home.dart';
import 'package:institutocana/componentes/slider_banner/item_banner_cursos.dart';
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
    final isMobile = (!kIsWeb) ? (Platform.isAndroid || Platform.isIOS) : false;
    final size = MediaQuery.of(context).size;
    final smallMode = size.width < 450;

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
          width: size.width,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: BannerHome(),
              ),
              SliderBanner(
                title: TextTitle(context: context, title: "Cursos"),
                height: 400,
                gridMode: !isMobile,
                itemSize: const Size(400, 200),
                itemMargin: const EdgeInsets.all(5),
                itemCount: 300,
                itemBuilder: (context, index, size) {
                  return ItemBannerCursos(
                    size: size,
                    urlImage:
                        "https://images.pexels.com/photos/459403/pexels-photo-459403.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Lorem ipsum dolor sit",
                    objective:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Suspendisse sit amet turpis elit. Etiam eget tempor turpis, vitae "
                        "lacinia massa. Morbi at lobortis magna, ut malesuada erat. Integer "
                        "eget molestie erat, a finibus mi. Proin eu mi eu nibh molestie porttitor."
                        " In libero ipsum, blandit cursus neque quis, varius malesuada nunc.",
                    date: "10/06/2023",
                    local: "Instituto Caná para Família",
                    onTap: () {
                      print(index);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
