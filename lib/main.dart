import 'package:AnimeApp/views/MainPage.dart';
import 'package:flutter/material.dart';

//I know reading code can be exausting, especially if its as badly wrotten as this
//So to make thing interstting I've hidden 10 animes recommendations here and there in comment, try and find em all
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Anime Information'),
    );
  }
}
