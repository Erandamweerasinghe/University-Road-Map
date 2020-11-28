//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uor_road_map/Screens/Login/login_page.dart';
import 'package:uor_road_map/Screens/SignUp/signup_page.dart';
import 'package:uor_road_map/constanents.dart';

class WelcomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      resizeToAvoidBottomPadding: false,
      body: WBody(),
    );
  }
}
class WBody extends StatefulWidget
{
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WBody>
{
   Widget _buildLogo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "WELCOME",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
      ],
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea( 
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: mainColor,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: firstColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),  
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(),
                  _buildContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildContainer()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Image.asset('assets/images/0.png'),
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
              //image: DecorationImage(image: AssetImage('assets/images/0.png'),fit: BoxFit.cover),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "UOR",
                      style: TextStyle(
                        //backgroundColor: Colors.lightBlue,
                        fontSize: MediaQuery.of(context).size.height / 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "NAVIGATION",
                      style: TextStyle(
                        //backgroundColor: Colors.lightBlue,
                        fontSize: MediaQuery.of(context).size.height / 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "SYSTEM",
                      style: TextStyle(
                        //backgroundColor: Colors.lightBlue,
                        fontSize: MediaQuery.of(context).size.height / 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                buildLoginButton(),
                buildSignUpButton(),
                //SpinKitDualRing(color: Colors.green,size: 40.0,),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget buildLoginButton()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: firstColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () => {
              Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: Login(),
                  duration: Duration(microseconds: 400),
                 ),
                ),
              },
            child: Text(
              "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 40,
                ),
              ),
        ),
        ),
      ],
    );
  }
  Widget buildSignUpButton()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: firstColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
           onPressed: () => {
              Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: SignUp(),
                  duration: Duration(microseconds: 400),
                 ),
                ),
              },
            child: Text(
              "SIGNUP",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 40,
                ),
              ),
        ),
        ),
      ],
    );
  }
}

