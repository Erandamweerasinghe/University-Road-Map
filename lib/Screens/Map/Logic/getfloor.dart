import 'package:uor_road_map/Screens/Common/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<dynamic> getfloor(List<dynamic> data,int selectedFloorID)
{

  //0=> floor location
  //1=> floor all places
  //2=> floor ID ( 0 /1 /2)

    List<dynamic> finaldata=new List<dynamic>();
     //this will hold marker
    Set<Marker> _marker={};

    //this will hold polyline
    Set<Polyline> _polyline={}; 

    
    if(data[2]==selectedFloorID)
    {
        //get floor polyline
        if(data[0].length>0)
        {
            Polyline floor =Polyline(
              polylineId:PolylineId("floor"),
              color: floorColor,
              width: floorWidth,
              points:data[0] );

              _polyline.add(floor);
        }

        
    }  

    //get all places marker
    if(data[1].length>0)
    {
        int count=data[1].length;
        for(int i=0;i<count;i++)
        {
            _marker.add(Marker(
              markerId: MarkerId(data[1][i][0]),
              infoWindow: InfoWindow(title: data[1][i][0]),
              position: LatLng(data[1][i][1],data[1][i][2])));
          
        }

    }


    finaldata.add(_polyline);
    finaldata.add(_marker);
    return finaldata;

}


