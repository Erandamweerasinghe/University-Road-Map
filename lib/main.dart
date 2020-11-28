import 'package:flutter/material.dart';
//import 'package:uor_road_map/Screens/Map/log_guest_map.dart';
//import 'package:uor_road_map/Screens/Map/main_map.dart';
//import 'package:uor_road_map/Screens/Map/search_map_show_page.dart';
import 'package:uor_road_map/load_page.dart';
//import 'package:uor_road_map/Screens/Welcome/welcome_page.dart';
//import 'package:uor_road_map/Screens/Map/addSearch_map_show_page.dart';
//import 'package:uor_road_map/Screens/Search/search_page.dart';
//import 'package:uor_road_map/Screens/AddSearch/add_search_page.dart';
//import 'package:uor_road_map/Screens/Term&Con/term_con_page.dart';
//import 'package:uor_road_map/Screens/SignUp/signup_page.dart';
//import 'package:uor_road_map/Screens/FPassword/forg_pass_page.dart';
//import 'package:uor_road_map/Screens/FPassword/reset_pwd_page.dart';
import 'Screens/Direction/direction_Page.dart';
import 'Screens/Map/search_map_show_page.dart';
import 'Screens/Search/search_page.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_getfloor.dart';
import 'package:uor_road_map/Screens/Request/ConvertData.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_placeInout.dart';
import 'package:uor_road_map/Screens/Map/Display/Display_PlaceInIn.dart';
import 'package:uor_road_map/Screens/Map/main_map.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  String a='{"floor_2_locations":[[5.940012,80.576011],[5.93991,80.576026],[5.939904,80.575928],[5.939807,80.575936],[5.939803,80.575962],[5.939809,80.57605],[5.939601,80.576067],[5.939599,80.575982],[5.939803,80.575962],[5.939809,80.57605],[5.939601,80.576067],[5.939605,80.576197],[5.939647,80.576225],[5.939609,80.576296],[5.939564,80.57627],[5.939605,80.576197],[5.939564,80.57627],[5.939529,80.576251],[5.939438,80.57642],[5.939617,80.576519],[5.939706,80.576344],[5.939663,80.576322],[5.9396,80.576438],[5.939503,80.576384],[5.939564,80.57627],[5.939503,80.576384],[5.9396,80.576438],[5.939663,80.576322],[5.939726,80.576216],[5.939721,80.576123],[5.939816,80.576124],[5.939813,80.576134],[5.939957,80.576361],[5.940127,80.576241],[5.94002,80.576063],[5.940012,80.576011],[5.940004,80.575923],[5.939904,80.575928]],"floor_0_routelocations":[[5.939881,80.57598],[5.939858,80.576008],[5.939858,80.576008],[5.939863,80.576037]],"floor_0_locations":[[5.93992,80.576028],[5.939881,80.576032],[5.939878,80.575928],[5.940004,80.575923],[5.940019,80.576018],[5.93992,80.576028],[5.939919,80.57609],[5.939821,80.576089],[5.939823,80.576037],[5.939718,80.576041],[5.939717,80.576087],[5.939821,80.576089],[5.939717,80.576087],[5.939701,80.576104],[5.939665,80.576114],[5.939656,80.576047],[5.939718,80.576041],[5.939717,80.576087],[5.939701,80.576104],[5.9397,80.576213],[5.939605,80.576197],[5.939574,80.576248],[5.939654,80.576296],[5.9397,80.576213],[5.939654,80.576296],[5.939644,80.576319],[5.939549,80.576485],[5.939438,80.57642],[5.939529,80.576251],[5.939564,80.57627],[5.939644,80.576319],[5.939564,80.57627],[5.939574,80.576248],[5.939605,80.576197],[5.939599,80.575982],[5.939803,80.575962],[5.939807,80.575936],[5.939878,80.575928],[5.939881,80.576032],[5.93992,80.576028]],"stair_1_2_locations":[[5.939842,80.576053],[5.939855,80.576066]],"outerroutelocations":[[5.93802,80.574649],[5.938217,80.574812],[5.938217,80.574812],[5.938433,80.575016],[5.938433,80.575016],[5.938596,80.575161],[5.938596,80.575161],[5.938856,80.575376],[5.938856,80.575376],[5.939179,80.575748],[5.939179,80.575748],[5.939221,80.575794],[5.939221,80.575794],[5.93945,80.576022],[5.93945,80.576022],[5.93954,80.576028],[5.939537,80.575931],[5.939588,80.575933],[5.939588,80.575933],[5.939816,80.575907],[5.939816,80.575907],[5.939881,80.57598]],"place":{"name":"CS Mini auditorium","lat":5.939878,"lon":80.576038},"stair_0_1_locations":[[5.939863,80.576037],[5.939842,80.576053]],"floor_2_routelocations":[[5.939855,80.576066],[5.939878,80.576067],[5.939878,80.576067],[5.939878,80.576038]]}';
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black26,
      ),
      //home:DrawFloor(drawfloor(a)), 
      //home: DrawRouteLine(drawroute(a)),
      // home: DrawPlaceInOut(drawplaceinout(a),1),
      //home: DrawPlaceInIn(drawplaceinin(a),16,15,1,2),
      //home: SearchPage(),
      home: MainMap(),
    );
  }
}

