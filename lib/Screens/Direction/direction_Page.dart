import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:uor_road_map/constanents.dart';
import 'package:uor_road_map/Screens/Common/data.dart';
import 'package:uor_road_map/Screens/Disition/disistionFunc.dart';
import 'package:uor_road_map/Screens/Request/JsonBody.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_PlaceInIn.dart';
import 'package:uor_road_map/Screens/Request/ConvertData.dart';

class DirectionPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "University of Ruhuna",
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: firstColor,
      ),
     
      home: Hpage(),
    );
  }
}
class Hpage extends StatefulWidget 
{
  @override
  _MHPage createState() => _MHPage();
}

class _MHPage extends State<Hpage>
{

int itm=0;

//GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

Future<String> createAlertDialog(BuildContext context) async{
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context,setState){

        return AlertDialog(
        title: Text("Select Department and Floor",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
        ),
        content: Form(
         // key: _fromkey,

          
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children:<Widget>[
              Text("Select Department"), 
              Container(
                height:MediaQuery.of(context).size.height * 0.076,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownButton(
                        isExpanded: true,
                        //hint: Text("Select Department"),
                        value: departmentvalue,
                        underline: Container(
                          height: 3,
                          color: Colors.deepPurpleAccent,
                        ),
                        items: department.map((departmentvalue){
                        return DropdownMenuItem(
                          value: departmentvalue,
                          child: Text(departmentvalue),
                        );
                      }).toList(),
                      onChanged: (selectedDepartment)
                      {
                        setState(()
                        {
                          departmentvalue  = selectedDepartment;        //Get Department value
                        });
                      }
                    ),
                  ],
                ),
              ),
            ),

              Text("Select Floor"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Padding(padding: EdgeInsets.all(12.0)),
                      DropdownButton(
                        isExpanded: true,
                        //hint: Text("Select Floor"),
                        value: floorvalue,
                        underline: Container(
                          height: 3,
                          color: Colors.deepPurpleAccent,
                         ),
                        items: floor.map((floorvlue){
                        return DropdownMenuItem(
                          value: floorvlue,
                          child: Text(floorvlue),
                        );
                      }).toList(),
                      onChanged: 
                      (selectedFloorID)
                      {
                        setState((){
                          floorvalue = selectedFloorID;          //Get Floor value
                          });
                      }
                    ),
                  ],
                ),
              ),
            ),
            
            
          ],
        ),
        ),
      ),

          actions: <Widget>[
            MaterialButton(
              onPressed: (){
                 setState((){
                   selectedDepartment=departmentvalue;
                   selectedFloorName=floorvalue;
                 });
                  Navigator.of(context).pop();
              },
                child: Text("OK", 
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

  String location,destination;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: firstColor,
            title: Text("Find out"),
            actions: <Widget>[

               DropdownButton<int>(
                iconSize: 30.0,
                iconEnabledColor: mainColor,
                value: itm,
                items: [
                   DropdownMenuItem(
                     child: Text("Out Side",
                      style: TextStyle(fontSize: 25.0),
                     ),
                      value: 0,
                     ),
                     DropdownMenuItem(
                      child: Text("In Side",
                        style: TextStyle(fontSize: 25.0),
                      ),
                      value: 1,
                      onTap: () async { 
                       await createAlertDialog(context);
                      }
                    ),
                ], 
                onChanged: (int value){
                    setState(() {
                    itm = value;
                    });
                   },
                 ),
            ],
             bottom: TabBar(
               tabs:[
                 Tab(icon: Icon(Icons.directions_car),
                 text: "Vehicle",
                 ),
                 Tab(icon: Icon(Icons.directions_walk),
                 text: "Walk",
                 ),
               ], 
               ),
          ),
           drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("User Name"), 
                  accountEmail: Text("User Email"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: mainColor,
                    child: Text("A"),
                  ),
                  decoration: BoxDecoration(
                    color: firstColor,
                  ),
                ),

                ListTile(
                  title: Text("Sign Out",style: TextStyle(fontSize: 18.0),),
                  leading: Icon(Icons.exit_to_app,color: blackcolor,), 
                  onTap: (){},
                ),

                ListTile(
                  title: Text("Profile",style: TextStyle(fontSize: 18.0),),
                  leading: Icon(Icons.person,color: blackcolor,),
                  onTap: (){},
                ),
                
                ListTile(
                  title: Text("Contacts",style: TextStyle(fontSize: 18.0),),
                  leading: Icon(Icons.contacts,color: blackcolor,),
                  onTap: (){},
                ),

                ListTile(
                  title: Text("Settings",style: TextStyle(fontSize: 18.0),),
                  leading: Icon(Icons.settings,color: blackcolor,),
                  onTap: (){},
                ),

                ListTile(
                  title: Text("Help and feedback",style: TextStyle(fontSize: 20.0),),
                  leading: Icon(Icons.help,color: blackcolor,),
                  onTap: (){},
                ),

              ],
            ),
          ), 
          body:
              TabBarView(
              children:[
                _tab1(),
                _tab2(),
               ],
              ),
        ),
      ),
    );
  }
  Widget _tab1()
  {
    return SingleChildScrollView(
      child: _buildUserVehicle(),
    );
  } 
  Widget _tab2()
  {
    return SingleChildScrollView(
      child: _buildUserWalk(),
    );
  }

  Widget _buildUserLocationVehicle()
  {
    vOr="v";
    return Padding(padding: EdgeInsets.all(8),
      child: DropDownField(
        controller: listSelect,
        hintText: "Enter your location",
        enabled: true,
        items: placesList,
        onValueChanged: (value)
        {
           setState(() {
             selectedStart = value;
           });
        },
      ),
    );
  }

  Widget _buildUserLocationWalk()
  {
    vOr="f";
    return Padding(padding: EdgeInsets.all(8),
      child: DropDownField(
        controller: listSelect,
        hintText: "Enter your location",
        enabled: true,
        items: placesList,
        onValueChanged: (value)
        {
           setState(() {
             selectedStart = value;
           });
        },
      ),
    );
  }

  Widget _buildDestinationVehicle()
  {
    vOr="v";
    return Padding(padding: EdgeInsets.all(8),
      child: DropDownField(
        controller: listSelecta,
        hintText: "Choose destination",
        enabled: true,
        items: placesList,
        onValueChanged: (value)
        {
           setState(() {
             selectedDestination = value;
           });
        },
      ),
    );
  }

  Widget _buildDestinationWalk()
  {
    vOr="f";
    return Padding(padding: EdgeInsets.all(8),
      child: DropDownField(
        controller: listSelecta,
        hintText: "Choose destination",
        enabled: true,
        items: placesList,
        onValueChanged: (value)
        {
           setState(() {
             selectedDestination = value;
           });
        },
      ),
    );
  }

  Widget buildEnterButtonVehicle()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.height / 10),
          width: 6 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 10,top: 60),
          child: RaisedButton(            
            //heroTag: null,
            elevation: 5.0,
            color: firstColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () => 
            {              
                 disitionFunc(context,arr)
            },

            child: Text(
              "Enter",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEnterButtonWalk()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,    
      children: <Widget>[
        Container(  
          height: (MediaQuery.of(context).size.height / 10),
          width: 6 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 10,top: 60),
          child: RaisedButton(
            //heroTag: null,
            elevation: 5.0,
            color: firstColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () => 
            {
              disitionFunc(context,arr)
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

  Widget _buildUserVehicle()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

         ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            height:MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                    ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildUserLocationVehicle(),
                            ],
                        ),
                      ),
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _buildDestinationVehicle(),
                          ],
                      ),
                    ),
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                    ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         buildEnterButtonVehicle(),
                      ],
                    ),
                  ),
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

  Widget _buildUserWalk()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

         ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            height:MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                    ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildUserLocationWalk(),
                            ],
                        ),
                      ),
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _buildDestinationWalk(),
                          ],
                      ),
                    ),
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: mainColor,
                    ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         buildEnterButtonWalk(),
                      ],
                    ),
                  ),
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
}
 
//for text

final listSelect = TextEditingController();
final listSelecta = TextEditingController();

String selectedStart = "";
String selectedDestination = "";
String vOr="";
String selectedFloorName= "";
String selectedDepartment="";

List<String> arr=[selectedStart,selectedDestination,selectedDepartment,selectedFloorName,vOr];



