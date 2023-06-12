import 'package:flutter/material.dart';
import 'package:institutocana/componentes/app_logo/app_logo.dart';

class AppBarCustom extends AppBar {
  AppBarCustom({
    Key? key,
    required BuildContext context,
    List<Widget>? actions,
  }) : super(
          key: key,
          title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                "/",
                (context) => false,
              ),
              child: const AppLogo(scale: 0.35),
            ),
          ),
          actions: [
            ...?actions,
            const Padding(padding: EdgeInsets.only(right: 10)),
          ],
        );
}
