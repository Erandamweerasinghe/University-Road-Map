import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uor_road_map/Screens/Login/login_page.dart';
import 'package:uor_road_map/constanents.dart';
import 'package:uor_road_map/Screens/Term&Con/term_con_page.dart';

class SignUp  extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      resizeToAvoidBottomPadding: false,
      body: SBody(),
    );
  }
}
class SBody extends StatefulWidget
{
    @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SBody> 
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username,password,email,id;
  bool checkB = false;
  bool first = true;

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
  Widget _buildUsernameRow() // user name 
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
  Widget _buidemailRow() // user email
  {
    return Padding(
      padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.name,
         /* onChanged: (value){
            setState(() {
              email = value;
            });
          },*/
          decoration: InputDecoration(
            prefixIcon: Icon(
                Icons.email,
                color: firstColor,
              ),
              labelText: "Email",
              hintText: "abc@gmail.com",
          ),
          textInputAction: TextInputAction.next,
          validator: (String eml) => EmailValidator.validate(eml)? null:"Invalid email address",
          onSaved: (eml) => email = eml,
        ),
      );
  }
  Widget _buildPasswordRow() // user password 
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
  Widget buildAgreeButton() // Terms and Conditions
  {
    
    return Row(
     // mainAxisAlignment: MainAxisAlignment.start,
     // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          checkColor: Colors.red,
          activeColor: Colors.black12,
          value: this.first, 
          onChanged: (bool value){
            setState(() {
              this.first = value;
            });
          }
          ),
          Text("I Agree with "),
          InkWell(
            child: Text("Term and Condition",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            ),
            onTap: (){
              Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: TCPage(),
                  duration: Duration(microseconds: 400),
                 ),
                );
            },
          ),
      ],
    );
  }
  Widget buildSignUpButton()
  {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
                _formKey.currentState.save()
              }
            },
            child: Text(
              "Sign Up",
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
  Widget buildLoginButton()
  {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 100.0,top: 5.0),
          child: FlatButton(
            onPressed: () => {
              Navigator.push(context, 
                PageTransition(
                  type: PageTransitionType.topToBottom, 
                  child: Login(),
                  duration: Duration(microseconds: 400),
                 ),
                ),
              },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "I'm already a member",
                    style: TextStyle(
                      color: secColor,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
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
      mainAxisSize: MainAxisSize.min,
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
                SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 25,
                        color: secColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildUsernameRow(),
                    _buidemailRow(),
                    _buildPasswordRow(),
                    buildAgreeButton(),
                    buildSignUpButton(),
                    buildLoginButton(),
                  ],
                ),
                
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
}