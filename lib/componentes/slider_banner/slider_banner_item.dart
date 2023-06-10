import 'package:flutter/material.dart';

class SliderBannerItem extends StatelessWidget {
  final Widget content;
  const SliderBannerItem({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      width: 400,
      height: 200,
      child: Container(
        child: content,
      ),
    );
  }
}
