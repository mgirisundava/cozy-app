import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        child: Image(
          width: 80,
          height: 80,
          image: AssetImage(tips.imageUrl),
        ),
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tips.title,
            style: blackTextStyle.copyWith(fontSize: 18),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Updated ${tips.updateAt}",
            style: greyTextStyle.copyWith(fontSize: 14),
          )
        ],
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.chevron_right),
        color: Colors.grey,
      )
    ]);
  }
}
