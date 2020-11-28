import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uor_road_map/Screens/FPassword/forg_pass_page.dart';
import 'package:uor_road_map/Screens/Login/login_page.dart';
import 'package:uor_road_map/constanents.dart';

class ResetPwd extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: blackcolor,
      resizeToAvoidBottomPadding: false,
      body: RPWDBody(),
    );
  } 
}
class RPWDBody extends StatefulWidget
{
  @override
  _ResetPageState createState() => _ResetPageState();
}
class _ResetPageState extends State<RPWDBody>
{
  int pin;
  String password,conpassword = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              height: MediaQuery.of(context).size.height * 0.7,
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
                  _buildcontainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "UOR NAVIGATION",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height/20,
              fontWeight: FontWeight.bold,
              color: blackcolor,
            ),
          ),
      ],
    );
  }

  Widget _buildcontainer()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildPin(),
                _buildPassword(),
                _buildConPassword(),
                _buildEnter(),
                _buildCancel(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPin()
  {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.format_list_numbered_rtl,
            color: firstColor,
          ),
          labelText: "Verification Number"
        ),
        onChanged: (value){
            setState(() {
              pin = value as int;
            });
          }
      ),
    );
  }

  Widget _buildPassword()
  {
     return Padding(
      padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
                Icons.lock,
                color: firstColor,
              ),
              labelText: "Password"
          ),
          validator: (String pwd){
            Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
            RegExp regex  = new RegExp(pattern);
            if(!regex.hasMatch(pwd))
              return "Invalid password";
            else
              return null;
          },
          onSaved: (pwd) => password = pwd,
          textInputAction: TextInputAction.done,
        ),
    );
  }

  Widget _buildConPassword()
  {
    return Padding(
      padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
                Icons.lock,
                color: firstColor,
              ),
              labelText: "Confirm Password"
          ),
          validator: (String copwd){
            Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
            RegExp regex  = new RegExp(pattern);
            if(!regex.hasMatch(copwd))
              return "Invalid password";
            else
              return null;
          },
          onSaved: (copwd) => conpassword = copwd,
          textInputAction: TextInputAction.done,
        ),
    );
  }

  Widget _buildEnter()
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
              if(_formKey.currentState.validate())
              {
                _formKey.currentState.save(),

                Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: Login(),
                  duration: Duration(microseconds: 400),
                 ),
                ), 
              }
            },
            child: Text(
              "Enter",
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

  Widget _buildCancel()
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
                child: ForgPass(),
                  duration: Duration(microseconds: 400),
                ),
              ), 
            },
            child: Text(
              "Cancel",
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