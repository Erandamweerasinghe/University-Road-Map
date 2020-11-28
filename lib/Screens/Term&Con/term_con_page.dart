import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uor_road_map/Screens/SignUp/signup_page.dart';
import 'package:uor_road_map/constanents.dart';

class TCPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: blackcolor,
        primaryColor: Colors.white,
      ), 
      home: TCBody(),
    );
  }
}
class TCBody extends StatefulWidget
{
  @override
  _TermConPageState createState() => _TermConPageState();
}
class _TermConPageState extends State<TCBody>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: firstColor,
            title: Text("Term and Condition",
            style: TextStyle(
              fontSize: 25.0
              ),
            ),
            leading: IconButton(icon: Icon(
              Icons.arrow_back,
              size: 30.0,
              color: mainColor,
            ),
             onPressed: () {
             Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: SignUp(),
                  duration: Duration(microseconds: 400),
                 ),
                );
             }
             ),
          ),
          body: Container(
            child: SingleChildScrollView(
            //margin: EdgeInsets.all(10.0),
            //width: 370,
              child: Text("Texting!!!!!!!!!!!!!!!!!!!!!!!!",
              overflow: TextOverflow.ellipsis,
              maxLines: 200,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
          ),
        ),
      ),
    );
  }
}