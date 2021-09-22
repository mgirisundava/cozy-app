import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int? index;
  final int? rating;

  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: index! <= rating!
          ? AssetImage("assets/images/icon_star.png")
          : AssetImage("assets/images/icon_star_grey.png"),
      width: 20,
    );
  }
}
