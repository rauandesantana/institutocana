import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef SliderBuilder = Widget Function(BuildContext, int, Size);

class SliderBanner extends StatelessWidget {
  final bool? gridMode;
  final Size sliderSize;
  final Size itemSize;
  final EdgeInsetsGeometry? itemMargin;
  final int itemCount;
  final SliderBuilder itemBuilder;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  const SliderBanner({
    super.key,
    this.gridMode,
    required this.sliderSize,
    required this.itemSize,
    this.itemMargin,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = (!kIsWeb) ? Platform.isAndroid || Platform.isIOS : false;
    int count = (sliderSize.width ~/ itemSize.width).toInt();
    if (count < 1) count = 1;
    final gridLayout = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: count,
      mainAxisExtent: itemSize.height,
    );
    final itemGridSize = Size(
      (sliderSize.width - ((itemMargin?.horizontal ?? 0) * count)) / count,
      itemSize.height,
    );

    final slide = SizedBox(
      height: itemSize.height,
      child: ListView.builder(
        controller: controller,
        physics: physics,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: itemMargin ?? EdgeInsets.zero,
          child: itemBuilder(context, index, itemSize),
        ),
      ),
    );

    final grid = SizedBox(
      height: sliderSize.height,
      child: GridView.builder(
        controller: controller,
        physics: physics,
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: itemMargin ?? EdgeInsets.zero,
          child: itemBuilder(context, index, itemGridSize),
        ),
        gridDelegate: gridLayout,
      ),
    );

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: (gridMode == true && !isMobile) ? grid : slide,
    );
  }
}
