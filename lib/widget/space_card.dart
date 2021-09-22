import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/pages/details.page.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsPage(space)));
      },
      child: Padding(
        padding: EdgeInsets.only(left: edge),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: 130,
                height: 110,
                child: Stack(
                  children: [
                    Image(
                      image: NetworkImage(space.imageUrl!),
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36))),
                        width: 70,
                        height: 30,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image:
                                    AssetImage("assets/images/icon_star.png"),
                                width: 22,
                                height: 22,
                              ),
                              Text(
                                "${space.rating}/5",
                                style: whiteTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name!,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      ("\$${space.price}"),
                      style: purpleTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      " / month",
                      style: greyTextStyle.copyWith(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "${space.city}, ${space.country}",
                  style: greyTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
