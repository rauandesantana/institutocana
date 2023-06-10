import 'package:flutter/material.dart';
import 'package:institutocana/componentes/slider_banner/slider_banner_item.dart';

class SliderBanner extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  const SliderBanner({super.key, required this.itemBuilder,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 500,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SliderBannerItem(
            content: itemBuilder(context, index),
          ),
        ),
      ),
    );
  }
}
