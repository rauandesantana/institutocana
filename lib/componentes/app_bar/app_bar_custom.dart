import 'package:flutter/material.dart';

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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/imagens/logo.png",
                    color: Colors.green.shade900,
                    width: 35,
                    height: 35,
                  ),
                  const Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 2,
                        child: Text(
                          "Instituto",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "CANÁ",
                          style: TextStyle(
                            fontFamily: "Kaczun Oldstyle",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ...?actions,
            const Padding(padding: EdgeInsets.only(right: 10)),
          ],
        );
}
