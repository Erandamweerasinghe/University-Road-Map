import 'dart:async';
import 'package:http/http.dart' as http;
//import 'package:uor_road_map/Screens/Map/drwaplace.dart';

 String josonArray;
 Future<String> getjsonvalue(String url) async
  {
     // String a="https://my.api.mockaroo.com/my_saved_schema.json?key=8699f700";
      var data=await http.get(url);
     
      if(data.statusCode==200)
      {
         josonArray=data.body;        
      }
    
    
      return josonArray;
  }
