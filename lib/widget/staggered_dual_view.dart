import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;

  const StaggeredDualView({Key? key, required this.itemBuilder, required this.itemCount, this.spacing = 0.0, this.aspectRatio = 0.5, this.offsetPercent = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final itemHeight = (width * 0.5) / aspectRatio;
      final height = constraints.maxHeight + itemHeight;
      return ClipRect(
        child: OverflowBox(
          maxHeight: height,
          minHeight: height,
          maxWidth: width,
          minWidth: width,
          child: GridView.builder(
              padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: aspectRatio,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing
              ),
              itemBuilder: (context, index) {
                return Transform.translate(
                  offset: Offset(0.0, index.isOdd ? itemHeight * offsetPercent : 0),
                  child: itemBuilder(context, index),
                );
              }, itemCount: itemCount,),
        ),
      );
    });
  }
}
