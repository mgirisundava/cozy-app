import '../models/space.dart';
import '../pages/error_page.dart';
import '../provider/space_provider.dart';
import '../theme.dart';
import '../widget/facility_item.dart';
import '../widget/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final Space space;

  DetailsPage(this.space);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    void _launchUrl(String url) async => await canLaunch(url)
        ? await launch(url)
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorPage(widget.space),
            ),
          );

    Future<void> showConfirmation() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Apakah kamu ingin menghubungi pemilik kos?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hubungi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchUrl("tel:${widget.space.phone}");
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image(
              image: NetworkImage(widget.space.imageUrl!),
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),

                      // TODO : TITLE

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name!,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ("\$${widget.space.price}"),
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                    Text(
                                      " / month",
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                RatingItem(
                                  index: 1,
                                  rating: widget.space.rating,
                                ),
                                RatingItem(
                                  index: 2,
                                  rating: widget.space.rating,
                                ),
                                RatingItem(
                                  index: 3,
                                  rating: widget.space.rating,
                                ),
                                RatingItem(
                                  index: 4,
                                  rating: widget.space.rating,
                                ),
                                RatingItem(
                                  index: 5,
                                  rating: widget.space.rating,
                                ),
                                RatingItem(
                                  index: 6,
                                  rating: widget.space.rating,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // TODO : MAIN FACILITIES

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          "Main Facilities",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              imageUrl: "assets/images/icon_dapur.png",
                              total: widget.space.numberOfKitchens,
                              name: " kitchen",
                            ),
                            FacilityItem(
                              imageUrl: "assets/images/icon_kamar.png",
                              total: widget.space.numberOfBedrooms,
                              name: " bedroom",
                            ),
                            FacilityItem(
                              imageUrl: "assets/images/icon_lemari.png",
                              total: widget.space.numberOfCupboards,
                              name: " lemari besar",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // TODO : PHOTOS

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          "Photos",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...widget.space.photos!.map((item) {
                                return Container(
                                    margin: EdgeInsets.only(left: edge),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image(
                                        image: NetworkImage(item),
                                        width: 110,
                                        height: 88,
                                        fit: BoxFit.cover,
                                      ),
                                    ));
                              }).toList(),
                              SizedBox(
                                width: edge,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // TODO : LOCATION

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Text(
                          "Location",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.space.address}\n${widget.space.city}",
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                _launchUrl(widget.space.mapUrl!);
                              },
                              child: Image(
                                image: AssetImage("assets/images/icon_map.png"),
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 2 - edge,
                        child: RaisedButton(
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          onPressed: () {
                            showConfirmation();
                          },
                          child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            ),

            // TODO : BACK & WISHLIST BUTTON

            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: AssetImage("assets/images/btn_back.png"),
                      width: 40,
                    ),
                  ),
                  Consumer<Space>(
                    builder: (ctx, space, _) => GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.space.isFavorite = !widget.space.isFavorite;
                        });
                      },
                      child: Image(
                        image: widget.space.isFavorite
                            ? AssetImage(
                                "assets/images/btn_wishlist_clicked.png")
                            : AssetImage("assets/images/btn_wishlist.png"),
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
