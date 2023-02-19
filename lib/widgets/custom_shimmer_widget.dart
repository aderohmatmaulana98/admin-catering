import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key, 
    required this.itemCount, 
    required this.itemBuilder, 
    required this.separateWidget, 
    this.scrollDirection = Axis.vertical
  });

  final int itemCount;
  final Widget itemBuilder;
  final Widget separateWidget;
  final Axis scrollDirection;


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        primary: false,
        itemBuilder: (context, index) {
          return itemBuilder;
        }, 
        separatorBuilder: (_, __) => separateWidget, 
        itemCount: itemCount
      ),
    );
  }
}