import 'package:flutter/material.dart';

class TextTitle extends Text {
  TextTitle({
    Key? key,
    required BuildContext context,
    required String title,
  }) : super(
    title,
    key: key,
    style: TextStyle(
      fontSize: 20,
      fontFamily: "Kaczun Oldstyle",
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.secondary,
    ),
  );

}