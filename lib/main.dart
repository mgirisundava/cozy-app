import 'package:bwa_cozy/models/space.dart';

import '../pages/splash_page.dart';
import '../provider/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SpaceProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Space(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        ));
  }
}
