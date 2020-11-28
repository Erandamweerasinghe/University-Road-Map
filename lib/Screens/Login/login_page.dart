import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:uor_road_map/Screens/Map/main_map.dart';
import 'package:uor_road_map/Screens/SignUp/signup_page.dart';
import 'package:uor_road_map/constanents.dart';
import 'package:uor_road_map/Screens/FPassword/forg_pass_page.dart';

class Login extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      resizeToAvoidBottomPadding: false,
      body: LBody(),
    );
  }
}
class LBody extends StatefulWidget
{
    @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LBody>
{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username,password;
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
  Widget _buildUsernameRow() 
  {
    return Padding(
      padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          /*onChanged: (value){
            setState(() {
              username = value;
            });
          },*/
          decoration: InputDecoration(
            prefixIcon: Icon(
                Icons.perm_identity,
                color: firstColor,
              ),
              labelText: "Username"
          ),
          textInputAction: TextInputAction.next,
          validator: (String name){
            Pattern pattern  =  r'^[A-Za-z0-9] + (? :[ _-][A-Za-z0-9]+)*$';
            RegExp regex = new RegExp(pattern);
              if(!regex.hasMatch(name))
                return "Inavalid username";
              else 
                return null;
          },
          onSaved: (name) => username = name,
        ),
      );
  }
  Widget _buildPasswordRow() 
  {
    return Padding(
      padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.text,
          obscureText: true,
          /*onChanged: (value){
            setState(() {
              password = value;
            });
          },*/
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
  Widget buildForgetPasswordButton()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(onPressed: (){
          Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: ForgPass(),
                  duration: Duration(microseconds: 400),
                 ),
                );
        }, 
        child: Text("Forgotten your password?",
          style: TextStyle(
            color: secColor,
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
              if(_formKey.currentState.validate())
              {
                _formKey.currentState.save(),
              }
            },
            child: Text( 
              "Log in",
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
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: FlatButton(
            onPressed: () => {
              Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: SignUp(),
                  duration: Duration(microseconds: 400),
                 ),
                ), 
              },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      color: firstColor,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ),
          ),
      ],
    );
  }
  Widget _buildContainer()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
            child: Form(
              key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        color: secColor,
                        fontSize: MediaQuery.of(context).size.height / 25,
                      ),
                    ),
                  ],
                ),
                _buildUsernameRow(),
                _buildPasswordRow(),
                buildForgetPasswordButton(),
                buildLoginButton(),
                buildSignUpButton(),
                buildLogInGuest(),
              ],
            ),
          ),
          ),
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

  Widget buildLogInGuest()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: (){}, 
          child: Text("Log in as a guest",
            style: TextStyle(
              fontSize: 20.0,
              color: tridColor,
            ),
          ),
        ),
      ],
    );
  }
}