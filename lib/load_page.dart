import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uor_road_map/Screens/Welcome/welcome_page.dart';
import 'package:uor_road_map/constanents.dart';

class Uor extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
        backgroundColor: Colors.white70,
        brightness: Brightness.light,
      ),
      home: Body(),
    );
  }
}
class Body extends StatefulWidget
{
  @override
  _DBody createState() => _DBody();
}
class _DBody extends State<Body>
{

  @override
  void initState(){
    super.initState();

    Timer(
      Duration(seconds: 4), 
      () => Navigator.push(
        context,MaterialPageRoute(
          builder: (context) => WelcomePage(),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Image.asset('assets/images/1.png'),
          SizedBox(height: 30.0,),
          SpinKitFadingCircle(color: Colors.brown,),
        ],
      ),
    );
  }
}