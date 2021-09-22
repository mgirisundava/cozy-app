import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final String? name;
  final int? total;

  FacilityItem({this.imageUrl = "", this.name, this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(imageUrl),
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: "${total}",
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: name,
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }
}
