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
  bool get isMobile => (!kIsWeb) ? Platform.isAndroid || Platform.isIOS : false;
  ScrollController scrollView = ScrollController();
  ScrollController sliderBanner = ScrollController();
  bool toggleScroll = false;

  @override
  void initState() {
    toggleScroll = false;
    scrollView.addListener(() {
      if (!isMobile) {
        final scrollMax = scrollView.position.maxScrollExtent;
        final scrollCurrent = scrollView.position.pixels;
        if (scrollCurrent >= scrollMax) setState(() => toggleScroll = true);
      }
    });
    sliderBanner.addListener(() {
      if (!isMobile) {
        final scrollCurrent = sliderBanner.position.pixels;
        if (scrollCurrent == 0.0) setState(() => toggleScroll = false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollView.dispose();
    sliderBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallMode = MediaQuery.of(context).size.width < 450;

    ScrollPhysics? scrollPhysics({bool? invert}) {
      if (isMobile) return null;
      bool toggle = (invert == true) ? !toggleScroll : toggleScroll;
      return (toggle) ? const NeverScrollableScrollPhysics() : null;
    }

    Widget itemCursos(
      BuildContext context,
      int index,
      Size size,
      Map<String, dynamic> data,
    ) {
      return ItemBannerCursos(
        size: size,
        urlImage:
            "https://images.pexels.com/photos/459403/pexels-photo-459403.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        title: "Lorem ipsum dolor sit",
        objective: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
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
    }

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = Size(constraints.maxWidth, constraints.maxHeight - 54);

          return SingleChildScrollView(
            controller: scrollView,
            physics: scrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: BannerHome(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: TextTitle(context: context, title: "Cursos"),
                ),
                SliderBanner(
                  sliderSize: size,
                  controller: sliderBanner,
                  physics: scrollPhysics(invert: true),
                  gridMode: true,
                  itemSize: const Size(400, 200),
                  itemMargin: const EdgeInsets.all(5),
                  itemCount: 300,
                  itemBuilder: (context, index, size) {
                    return itemCursos(context, index, size, {});
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
