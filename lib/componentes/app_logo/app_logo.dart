import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  final double? scale;

  const AppLogo({
    super.key,
    this.scale,
  });

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10 * (widget.scale ?? 1)),
          child: Image.asset(
            "assets/imagens/logo.png",
            color: Colors.green.shade900,
            fit: BoxFit.contain,
            width: 86 * (widget.scale ?? 1),
            height: 118 * (widget.scale ?? 1),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10 * (widget.scale ?? 1)),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 5 * (widget.scale ?? 1),
                child: Text(
                  "Instituto",
                  style: TextStyle(
                    fontSize: 28 * (widget.scale ?? 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30 * (widget.scale ?? 1)),
                child: Text(
                  "CANÁ",
                  style: TextStyle(
                    fontFamily: "Kaczun Oldstyle",
                    fontWeight: FontWeight.w500,
                    fontSize: 60 * (widget.scale ?? 1),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
