import '../models/city.dart';
import '../models/space.dart';
import '../models/tips.dart';
import '../provider/space_provider.dart';
import '../theme.dart';
import '../widget/bottom_navbar_item.dart';
import '../widget/city_card.dart';
import '../widget/space_card.dart';
import '../widget/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          // TODO : TITLE/HEADER

          SizedBox(
            height: edge,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              "Explore Now",
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              "Mencari kosan yang cozy",
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          // TODO : POPULAR CITIES

          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              "Popular Cities",
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 150,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              SizedBox(
                width: edge,
              ),
              CityCard(City(
                  id: 1, imageUrl: "assets/images/city1.png", name: "Jakarta")),
              SizedBox(
                width: edge,
              ),
              CityCard(City(
                  id: 2,
                  imageUrl: "assets/images/city2.png",
                  name: "Bandung",
                  isPopular: true)),
              SizedBox(
                width: edge,
              ),
              CityCard(City(
                  id: 3,
                  imageUrl: "assets/images/city3.png",
                  name: "Surabaya")),
              SizedBox(
                width: edge,
              ),
              CityCard(City(
                  id: 4,
                  imageUrl: "assets/images/city4.png",
                  name: "Palembang")),
              SizedBox(
                width: edge,
              ),
              CityCard(City(
                  id: 5,
                  imageUrl: "assets/images/city5.png",
                  name: "Aceh",
                  isPopular: true)),
              SizedBox(
                width: edge,
              ),
              CityCard(City(
                  id: 6, imageUrl: "assets/images/city6.png", name: "Bogor")),
              SizedBox(
                width: edge,
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),

          // TODO : RECOMMENDED SPACE

          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              "Recommended Space",
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),

          FutureBuilder(
            future: spaceProvider.getRecommendedSpace(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Space> data = snapshot.data;

                int index = 0;

                return Column(
                  children: data.map((item) {
                    index++;
                    return Container(
                      margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                      child: SpaceCard(item),
                    );
                  }).toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          SizedBox(
            height: 30,
          ),

          // TODO : TIP & GUIDANCE

          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              "Tips & Guidance",
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TipsCard(
                  Tips(
                      id: 1,
                      title: "City Guidelines",
                      imageUrl: "assets/images/tips1.png",
                      updateAt: "20 Apr"),
                ),
                SizedBox(
                  height: 20,
                ),
                TipsCard(
                  Tips(
                      id: 2,
                      title: "Jakarta Fairship",
                      imageUrl: "assets/images/tips2.png",
                      updateAt: "11 Dec"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 119,
          ),
        ]),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: edge),
        width: MediaQuery.of(context).size.width - (2 * edge),
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xFFF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/images/icon_home.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_mail.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_card.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_love.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
