import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uor_road_map/Screens/FPassword/reset_pwd_page.dart';
import 'package:uor_road_map/constanents.dart';
import 'package:email_validator/email_validator.dart';

class ForgPass extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
      resizeToAvoidBottomPadding: false,
      body: FBody(),
    );
  }
}
class FBody extends StatefulWidget
{
    @override
  _ForgPassPageState createState() => _ForgPassPageState();
}
class _ForgPassPageState extends State<FBody>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 150.0,),
                    Container(
                      width: 270,
                      child: Text("To reset your password,submit your email address below.If we can find yor in the database,an email will be send to your email address,with instruction how to get access again.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50.0,),
                    Container(
                      width: 250,
                      child: Text("Search by email",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                      ),
                    ),
                  ],
                ),
                _buidemailRow(),
                buildSearchButton(),
              ],
            ),
            ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buidemailRow() // user email
  {
    return Padding(
      padding: EdgeInsets.all(8),
        child: TextFormField(
          keyboardType: TextInputType.name,
          /*onChanged: (value){
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

  Widget buildSearchButton()
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
                  child: ResetPwd(),
                  duration: Duration(microseconds: 400),
                 ),
                ), 
              }
            },
            child: Text(
              "Search",
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