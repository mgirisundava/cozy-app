import '../models/space.dart';
import '../theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Space space;
  ErrorPage(this.space);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/error.png"),
                width: 300,
              ),
              SizedBox(
                height: 70.5,
              ),
              Text(
                "Where are you going?",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: purpleColor,
                  child: Text(
                    "Back to Home",
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
