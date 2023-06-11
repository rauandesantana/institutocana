import 'package:flutter/material.dart';

typedef SliderBuilder = Widget Function(BuildContext, int, Size);

class SliderBanner extends StatelessWidget {
  final Widget? title;
  final double? height;
  final bool? gridMode;
  final Size itemSize;
  final EdgeInsetsGeometry? itemMargin;
  final int itemCount;
  final SliderBuilder itemBuilder;

  const SliderBanner({
    super.key,
    this.title,
    this.height,
    this.gridMode,
    required this.itemSize,
    this.itemMargin,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int count = (width ~/ itemSize.width).toInt();
    if (count < 1) count = 1;
    final gridLayout = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: count,
      mainAxisExtent: itemSize.height,
    );
    final gridSize = Size(
      (width - ((itemMargin?.horizontal ?? 0) * count)) / count,
      itemSize.height,
    );

    final slide = SizedBox(
      height: itemSize.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: itemMargin ?? EdgeInsets.zero,
          child: itemBuilder(context, index, itemSize),
        ),
      ),
    );

    final grid = SizedBox(
      height: height,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (context, index) => Padding(
          padding: itemMargin ?? EdgeInsets.zero,
          child: itemBuilder(context, index, gridSize),
        ),
        gridDelegate: gridLayout,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        (title != null)
            ? Padding(padding: const EdgeInsets.only(left: 25), child: title!)
            : const SizedBox(width: 0, height: 0),
        (gridMode == true) ? grid : slide,
      ],
    );
  }
}
