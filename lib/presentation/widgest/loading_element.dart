import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingElement extends StatelessWidget {
  const LoadingElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      ),
    );
  }
}
