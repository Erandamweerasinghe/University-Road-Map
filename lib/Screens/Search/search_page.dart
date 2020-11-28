import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:uor_road_map/constanents.dart';
import 'package:uor_road_map/Screens/Common/data.dart';
import 'package:uor_road_map/Screens/Disition/disistionFunc.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_getfloor.dart';
import 'package:uor_road_map/Screens/Request/ConvertData.dart';

class SearchPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Spage(),
    );
  }
}
class Spage extends StatefulWidget 
{
  @override
  _MHPage createState() => _MHPage();
}
class _MHPage extends State<Spage>
{
  String location,destination;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: firstColor,
            title: Text("University of Ruhuna"),
          ),
          body: SingleChildScrollView(
             child: _buildUser(),
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
      ),
    );
  }
 
  Widget _buildDestination()
  {
    return Padding(padding: EdgeInsets.all(8),
      child: DropDownField(
        itemsVisibleInDropdown: 7,
        controller: placeNameSelect,
        hintText: "Choose destination",
        enabled: true,
        items: searchPlaces,
        onValueChanged: (value)
        {
           setState(() {
             placeNameselected = value;
           });
        },
      ),
    );
  }

  Widget buildEnterButton()                                             //Enter Button 
  {
    String b='{"places":[{"name":"CS Lecturers room","lat":5.939586,"lon":80.576387},{"name":"CS Instructors room","lat":5.939646,"lon":80.576274},{"name":"CS Computer lab 1","lat":5.939725,"lon":80.576067},{"name":"CS Mini auditorium","lat":5.939878,"lon":80.576038}],"floor_2_locations":[[5.940012,80.576011],[5.93991,80.576026],[5.939904,80.575928],[5.939807,80.575936],[5.939803,80.575962],[5.939809,80.57605],[5.939601,80.576067],[5.939599,80.575982],[5.939803,80.575962],[5.939809,80.57605],[5.939601,80.576067],[5.939605,80.576197],[5.939647,80.576225],[5.939609,80.576296],[5.939564,80.57627],[5.939605,80.576197],[5.939564,80.57627],[5.939529,80.576251],[5.939438,80.57642],[5.939617,80.576519],[5.939706,80.576344],[5.939663,80.576322],[5.9396,80.576438],[5.939503,80.576384],[5.939564,80.57627],[5.939503,80.576384],[5.9396,80.576438],[5.939663,80.576322],[5.939726,80.576216],[5.939721,80.576123],[5.939816,80.576124],[5.939813,80.576134],[5.939957,80.576361],[5.940127,80.576241],[5.94002,80.576063],[5.940012,80.576011],[5.940004,80.575923],[5.939904,80.575928]]}';
      
        
       /* FloatingActionButton(
        heroTag: null,
        onPressed:()=>{
           
            //seachDisition(context,placeNameselected)
        })

       */
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 2.5 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: firstColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            
            onPressed: () => 
            {
                          
                seachDisition(context,placeNameselected)
            },
            

            child: Text(
              "Enter",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 30,
              ),
            ),
          ),
        ),
      ],
    );
    
  }
  Widget _buildUser()
  {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.64,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildDestination(),
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
            height: MediaQuery.of(context).size.height * 0.22 ,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   buildEnterButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}

String placeNameselected = "";