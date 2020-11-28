import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_PlaceInIn.dart';
import 'dart:async';
import 'package:uor_road_map/constanents.dart';
import 'package:uor_road_map/Screens/Direction/direction_Page.dart';
import 'package:uor_road_map/Screens/Search/search_page.dart';
import 'package:uor_road_map/Screens/Request/ConvertData.dart';
//import 'package:dropdownfield/dropdownfield.dart';

class MainMap extends StatefulWidget
{
  MainMap() : super();

  final String txt= "University of Ruhuna";
  @override
  MainMapState createState() => MainMapState();

}
class MainMapState extends State<MainMap>
{
  
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(37.42796133580664, -122.085749655962);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position = CameraPosition(
    bearing: 192.833,
    target: LatLng(37.43796133580664, -122.085749655962),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position),);
  }

  _onMapCreated(GoogleMapController controller)
  {
    _controller.complete(controller);
  }

  _onCamMove(CameraPosition position)
  {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed()
  {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal 
      ? MapType.satellite 
      : MapType.normal;
    });
  }

  _onSerachButtonPress()
  {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context)=>SearchPage() ));
  }

  _onDirectionButtonPress()
  {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context)=>DirectionPage() ));
  }


 _onAddMarkerButtonPressed()
  {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: "Title",
          snippet: "snippet",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
  Widget button(Function function,IconData icon)
  {
    return FloatingActionButton(
      heroTag: null,
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: colorBlue,
      child: Icon(
        icon,
        size: 36.0,
      ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.txt,
          style: TextStyle(
            color: Colors.white,
          ),
          ),
          backgroundColor: firstColor,
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
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCamMove,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: <Widget>[
                      button(_onMapTypeButtonPressed, Icons.map),
                      SizedBox(height: 16.0, 
                      ),
                      button(_onAddMarkerButtonPressed, Icons.add_location),
                      SizedBox(
                        height: 16.0,
                      ),
                      button(_goToPosition, Icons.location_searching),
                      SizedBox(
                        height: 16.0,
                      ),
                      button(_onSerachButtonPress,Icons.search),
                      SizedBox(
                        height: 16.0,
                      ),
                      button(_onDirectionButtonPress,Icons.directions),
                      SizedBox(
                        height: 16.0,
                      ),
                 

                     // addsearch(),
                      //SizedBox(
                      //  height: 16.0,
                     // ),
                      //search(),
                    ],
                  ),
                ),
                ),
          ],
        ),
      ),
    );
  }
  
  Widget addsearch()
  {
    return Column(
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 2.5 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: colorBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () => {},
           /* child: Text( 
              "On Campus",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 50,
                ),
              ),*/
          ),
        ),
      ],
    );
  }

  Widget search()
  {
    return Column(
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 2.5 * (MediaQuery.of(context).size.width /10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: colorBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () => {},
            child: Text( 
              "Not On Campus",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: MediaQuery.of(context).size.height / 50,
                ),
              ),
          ),
        ),
      ],
    );
  }
}