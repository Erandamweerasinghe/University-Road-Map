import 'package:flutter/cupertino.dart';
import 'package:uor_road_map/Screens/Common/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uor_road_map/Screens/Common/placeLatLng.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_placeInout.dart';
import 'package:uor_road_map/Screens/Disition/disistionFunc.dart';

List<dynamic> placeInout(List<dynamic> data,int selectedFloorID,String startFname)
{
      //0=>outer routes
      //1=>floor routes
      //      0=>ground floor
      //      1=>first floor
      //      2=>second floor
      //2=>stair routes
      //      0=>stair 01
      //      1=>stair 12
      //3=>floor cordinates
      //      0=>ground floor
      //      1=>first floor
      //      2=>second floor

    List<dynamic> finaldata=new List<dynamic>();
     //this will hold marker
    Set<Marker> _marker={};

    //this will hold polylinefg
    Set<Polyline> _polyline={}; 
    int startFloorID=getsAdfloorID(startFname);
    List<double> startLocation=placeLatLng[startFName];


    
    if(selectedFloorID == 0 && data[0].length>0 )
    {
        //get outer routes
        if(data[0].length>0)  //selected floorID should be ground
        {
            Polyline outerR=Polyline(
              polylineId:PolylineId("outerR"),
              color: routeColor,
              width: routeWidth,
              points: data[0] );

              _polyline.add(outerR);
        }

    }

    if(data[3][selectedFloorID].length>0)
    {
     
        //add floor Routes
        if(data[1][selectedFloorID].length>0)
        {
             Polyline floorRoute=Polyline(
              polylineId:PolylineId("floorR"),
              color:routeColor,
              width: routeWidth,
              visible: true,
              points:data[1][selectedFloorID]);

              _polyline.add(floorRoute);
        }

        //add stair routes polyline
        if(selectedFloorID==2)
        {
          //join floor 2 routes and stair12 routes
         // data[2][1]=joinStair(data[2][1],data[1][2]);
          //stair12
          if(data[2][1].length>0)
          {
              Polyline stair12=Polyline(
                  polylineId:PolylineId("stair12"),
                  color: stairColor,
                  width:stairWidth,
                  points:data[2][1]);

                  _polyline.add(stair12);
          }
        }

        if(selectedFloorID==1)
        {
          //stair01
          if(data[2][0].length>0)
          {
              Polyline stair01=Polyline(
                  polylineId:PolylineId("stair01"),
                  color: stairColor,
                  width:stairWidth,
                  points:data[2][0]);

                  _polyline.add(stair01);
          }
        }
      

        //add floor polyline
        if(data[3][selectedFloorID].length>0)
        {
          Polyline floor1=Polyline(
              polylineId:PolylineId("floor1"),
              color: floorColor,
              width:floorWidth,
              points:data[3][selectedFloorID]);

              _polyline.add(floor1);
        }
        
    }

        //Start marker
        if(selectedFloorID == startFloorID)
        {
            _marker.add(Marker(
              markerId:MarkerId("start"),
              position:LatLng(startLocation[0],startLocation[1]),
              icon:userLocation ));
        }
        //Destination Marker
        if(data[0].length>0 && selectedFloorID==0) //selected floorId should be ground
        {
            int last=data[0].length-1;
            _marker.add(Marker(
              markerId:MarkerId("destination"),
              position: LatLng(data[0][last].latitude,data[0][last].longitude),
              icon:userDestination)
            
            );           
        }

    finaldata.add(_polyline);
    finaldata.add(_marker);

    return finaldata;

}

List<LatLng> joinStair(List<LatLng> stair,List<LatLng> route)
{
    int last=route.length-1;
    stair.add(route[last]);

    return stair;
}


int getdestionationFloor(int id)
{
    if(groundFloor.contains(id))
        return 0;
    else if(firstFloor.contains(id))
        return 1;
    else if(secondFloor.contains(id))
        return 2;
    else
        return 1;
}
String getderection(int start,int end)
{
    if(start<end)
      return "UP";
    else if(start>end)
      return "DOWN";
    else if(start==end) //same floor
      return "NO";
    else
      return "NO";
}
