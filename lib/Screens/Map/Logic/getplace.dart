import 'package:uor_road_map/Screens/Common/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<dynamic> getplace(List<dynamic> data,int selectedFloorID)
{

    //0=>outer routes
    //1=> floor routes 
    //      0 =>groud floor
    //      1 =>first floor
    //      2 =>second floor
    //2=>stair  (01  /  12)
    //3=>floor  (0 / 1 / 2)
    //4=>place 
    //      0=>name
    //      1=>lat
    //      2=>lng

    List<dynamic> finaldata=new List<dynamic>();
     //this will hold marker
    Set<Marker> _marker={};

    //this will hold polyline
    Set<Polyline> _polyline={}; 
  
    if(data[3][selectedFloorID].length>0)
    {
         //get outer routes polyline
        if(data[0].length>0)
        {
            Polyline outerR=Polyline(
              polylineId:PolylineId("outerR"),
              color: routeColor,
              width: routeWidth,
              points: data[0] );

              _polyline.add(outerR);
        }

        //get floor Routes
        if(data[1][selectedFloorID].length>0)
        {
            Polyline floorR=Polyline(
              polylineId:PolylineId("floorR"),
              color: floorColor,
              width: floorWidth,
              points: data[1][selectedFloorID] );

              _polyline.add(floorR);
        }


        //get stair routes polyline
        if(selectedFloorID==0)
        {
            //stair 01
            if(data[2][selectedFloorID].length>0)
            {
              Polyline stair01=Polyline(
                polylineId:PolylineId("stair01"),
                color: stairColor,
                width: stairWidth,
                points: data[2][selectedFloorID] );

                _polyline.add(stair01);           
            }
        }
        if(selectedFloorID==1)
        {
            //stair12
            if(data[2][selectedFloorID].length>0)
            {
              Polyline stair12=Polyline(
                polylineId:PolylineId("stair12"),
                color: stairColor,
                width: stairWidth,
                points: data[2][selectedFloorID] );

                _polyline.add(stair12);           
            }       
        }

        //get floor polyline
        if(data[3][selectedFloorID].length>0)
        {
              Polyline floor=Polyline(
                polylineId:PolylineId("floor"),
                color: floorColor,
                width: floorWidth,
                points: data[3][selectedFloorID] );

                _polyline.add(floor);
        }

        //get place marker
        if(data[4].length>0)
        {
          String name=data[4][0];
                _marker.add(Marker(
                  markerId: MarkerId(data[4][0]),
                  infoWindow: InfoWindow(title: name),
                  position: LatLng(data[4][1],data[4][2])));
              
        }
      
    }
    finaldata.add(_polyline);
    finaldata.add(_marker);
    return finaldata;

}


