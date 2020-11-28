
import 'package:flutter/material.dart';  
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uor_road_map/Screens/Common/data.dart';


void showMessage(int floorid)
{
    String floorName=getFloorName(floorid);
    if(floorName.length>0)
    {
        Fluttertoast.showToast(
          msg:" Your destination floor is \n "+floorName ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_LEFT,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.amber,
          textColor: Colors.black );
    }

}

String getFloorName(int floorid)
{
    String name="";
    if(firstFloor.contains(floorid))
        name="First Floor";
    else if(second_floor.contains(floorid))
        name="Second Floor";
    else
        name="Ground Floor";

    return name;
}