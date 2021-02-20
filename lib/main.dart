import 'package:flutter/material.dart';
import 'package:bang/View/LandingPage.dart';
import 'package:bang/View/Profile.dart';
import 'package:provider/provider.dart';
import 'Model/CharacterProfile.dart';
import 'package:bang/utils/envConfig.dart';
import 'package:bang/utils/size_config.dart';
import 'package:bang/Controller/Services.dart';

void main() => runApp(MultiProvider(child: MyApp(),
providers: [
  ChangeNotifierProvider<Popular>.value(value: Popular()),
  ChangeNotifierProvider<Villains>.value(value: Villains()),
],
));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (BuildContext context) {

        BuildEnvironment.init(flavor: BuildFlavor.development);

        Size size = MediaQuery.of(context).size;
        SizeConfig.init(context, width: size.width, height: size.height, allowFontScaling: true);

        return LandingPage();

      }),
    );
  }
}
