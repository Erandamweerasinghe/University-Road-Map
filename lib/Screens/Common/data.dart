
import 'dart:ffi';

import 'package:flutter/material.dart';

List<String> placesList=["Your Location", "CS Lecture's Room","CS Instructor's Room","CS Computer Lab 01",
"CS Mini-auditorium","CS Head's room","CS Conference Room","CS Record Room",
"CS Special Lab","CS Computer lab 02","CS E-Learning Center","CS Special Room","CS Demostrator's Room",
"CS Main-auditorium","CS Car park","CS Wash Rooms",
"CS Computer Lab 03","Lecture Hall 01","Main Gate","Y Junction","Library Junction","Library","Scenes Auditorium",
"Art Cantin","Auditorium","Student's Well fair branch","Maths Department",
"Computer Science Department" ,"Scenes faculty Cantin","Science Dean office","Botany Department",
"Zoology Department","Faculty of fisharies","Maths Lecture hall 1","Maths Lecture hall 2","Physics Department",
"Chemistry Department","Medical Center","Student Common room","Student reading place"];

List<String> searchPlaces=[ "CS Lecture's Room","CS Instructor's Room","CS Computer Lab 01",
"CS Mini-auditorium","CS Head's room","CS Conference Room","CS Record Room",
"CS Special Lab","CS Computer lab 02","CS E-Learning Center","CS Special Room","CS Demostrator's Room",
"CS Main-auditorium","CS Car park","CS Wash Rooms",
"CS Computer Lab 03","Lecture Hall 01","Main Gate","Y Junction","Library Junction","Library","Scenes Auditorium",
"Art Cantin","Auditorium","Student's Well fair branch","Maths Department",
"Computer Science Department" ,"Scenes faculty Cantin","Science Dean office","Botany Department",
"Zoology Department","Faculty of fisharies","Maths Lecture hall 1","Maths Lecture hall 2","Physics Department",
"Chemistry Department","Medical Center","Student Common room","Student reading place"];


const String GOOGL_KEY="AIzaSyD27-xwm_C9mv9V2mb2hki_XfzKTD5TYRg";
final placeNameSelect = TextEditingController();

Map<String,int> departmentID={"Computer Science":1,"Zoology":2,"Chemistry":3,"Botany":4,"Physics":5,"Mathematics":6};
List<String> department=["Computer Science","Zoology","Chemistry","Botany","Physics","Mathematics"];
List<String> floor=["Ground floor","First floor","Second floor"];
String floorvalue  = "Ground floor"; //default floor value
String departmentvalue ="Computer Science";  //default department value
 

List<String> outSideplaces=["Main Gate","Y Junction","Library Junction",
    "Library","Student's Well fair branch","Maths Department","Computer Science Department",
    "Scenes Auditorium","Scenes faculty Cantin","Science Dean office",
    "Botany Department","Zoology Department","Faculty of fisharies",
    "Maths Lecture hall 1","Maths Lecture hall 2","Physics Department",
    "Chemistry Department","Medical Center","Student Common room","Student reading place"];

List<String> inSidePlces=[ "CS Lecture's Room","CS Instructor's Room","CS Computer Lab 01",
    "CS Mini-auditorium","CS Head's room","CS Conference Room",
    "CS Record Room","CS Special Lab","CS Computer lab 02",
    "CS E-Learning Center","CS Special Room","CS Demostrator's Room",
    "CS Main-auditorium","CS Car park","CS Wash Rooms","CS Computer Lab 03","Lecture Hall 01"];

List<String> ground_floor=["CS Car park","CS Wash Rooms","CS Computer Lab 01"];

List<String> first_floor=["CS Lecture's Room","CS Instructor's Room","CS Head's room",
    "CS Conference Room","CS Record Room","CS Special Lab","CS Computer lab 02",
    "CS E-Learning Center","CS Special Room","CS Demostrator's Room",
    "CS Main-auditorium"];

List<String> second_floor=["CS Mini-auditorium","CS Computer Lab 03"];



String port="http://104.197.251.167";
List<int> groundFloor=[14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37];
List<int> firstFloor=[5,6,7,8,9,10,11,12,13];
List<int> secondFloor=[1,2,3,4];


//Color
const routeColor=Color.fromARGB(255,40,122,198);
const floorColor=Color.fromARGB(150,25,162,150);
const stairColor=Colors.red;

//width
const int routeWidth=8;
const int floorWidth=3;
const int stairWidth=8;

const MAX_FLOOR=3;
const GROUND_FLOOR=0;
const FIRST_FLOOR=1;
const SECOND_FLOOOR=2;
const double ZOOM=20.0;

/*
  01-Lecture's Room               
  02-Instructor's Room            
  03-Computer Lab 01              
  04-Mini-auditorium              
  05-Head's room                  
  06-Conference Room              
  07-Record Room                 
  08-Special Lab                  
  09-Computer lab 02
  10-E-Learning Center
  11-Special Room
  12-Demostrator's Room
  13-Main-auditorium
  14-Car park
  15-Wash Rooms (CS)
  16-Computer Lab 03
  17-Lecture Hall 01
  18-Server Room
  19-Car park 
  20-Wash Rooms (CS)
  21-Computer Lab 01
  22-Main Gate
  23-Library
  24-Scenes Library
  25-Scenes Auditorium
  26-Scenes Cantin
  27-Art Cantin
  28-Auditorium
*/