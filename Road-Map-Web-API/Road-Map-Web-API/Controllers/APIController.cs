using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Text.Json;
using System.Collections;

namespace Road_Map_Web_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class APIController : Controller
    {
        [HttpGet]
        [Route("GetFloor/{department:int}/{floor:int}")]
        public JsonResult GetFloor(int department,int floor)
        {
            int n = 0;
            List<double[]> lst = new List<double[]>();
            var final = new Hashtable();
            Place pl = new Place();
            double[] temp = new double[2];
            double[,] floorLocations = GetFloorLocations(department, floor);
            Dictionary<string, double[]> places = GetFloorPlaces(department, floor);
            Place[] arr = new Place[places.Count];

            for (int i = 0; i < floorLocations.GetLength(0); i++)
            {
                temp[0] = floorLocations[i, 0];
                temp[1] = floorLocations[i, 1];
                lst.Add(temp);
            }
            final.Add("floorlocations", lst);

            foreach (KeyValuePair<string,double[]> pair in places)
            {
                pl.name = pair.Key;
                temp = pair.Value;
                pl.lat = temp[0];
                pl.lon = temp[1];
                arr[n++] = pl;
            }
            final.Add("places", arr);

            return Json(final);

            //return Json("Department - "+department+" Florr - "+floor+" Requested..!");
            //return Json(new double[,] { { 1, 2 }, { 2, 3 } });
        }

        [HttpGet]
        [Route("GetRoute/{startLAT:double}/{startLON:double}/{endLAT:double}/{endLON:double}/{method}")]
        public IActionResult GetRoute(double startLAT, double startLON, double endLAT, double endLON , [FromRoute] string method)
        {
            List<double[]> lst = new List<double[]>();
            var final = new Hashtable();
            double[] temp = new double[2];
            Calculations cal = new Calculations();
            int V_No,grapgNo;
            switch (method)
            {
                case "f":
                    V_No = Data.footGrapheVertices;
                    grapgNo = 0;
                    break;
                case "v":
                    V_No = Data.vehicleGrapheVertices;
                    grapgNo = 1;
                    break;              
                default:
                    V_No=Data.footGrapheVertices;
                    grapgNo = 0;
                    break;
            }
            int start = cal.GetNearestVertexNo(V_No, grapgNo, startLAT, startLON);
            int end = cal.GetNearestVertexNo(V_No, grapgNo, endLAT, endLON);
            if (start != end)
            {
                int[] routes = cal.GetRouteNumbers(grapgNo, start, end);
                double[,] routeLocations;
                foreach (int r in routes)
                {
                    if (grapgNo == 0)
                        routeLocations = GetFootRoute(r);
                    else
                        routeLocations = GetVehicleRoute(r);

                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                final.Add("routelocations", lst);
                return Json(final);
            }
            return Json(final);
            //return Json(startLAT+" -- "+ startLON + " -- "+ endLAT + " -- "+ endLON + " -- "+ method);
        }

        [HttpGet]
        [Route("GetPlace/{startLAT:double}/{startLON:double}/{placeID:int}/{method}")]
        public IActionResult GetPlace(double startLAT, double startLON, int placeID, string method)
        {
            List<double[]> lst = new List<double[]>();
            var final = new Hashtable();
            double[,] routeLocations;
            double[] temp = new double[2];
            Calculations cal = new Calculations();
            int V_No, grapgNo;
            switch (method)
            {
                case "f":
                    V_No = Data.footGrapheVertices;
                    grapgNo = 0;
                    break;
                case "v":
                    V_No = Data.vehicleGrapheVertices;
                    grapgNo = 1;
                    break;
                default:
                    V_No = Data.footGrapheVertices;
                    grapgNo = 0;
                    break;
            }

            int start = cal.GetNearestVertexNo(V_No, grapgNo, startLAT, startLON);
            int localEnd = cal.FindEnterenceVertexNo(placeID, startLAT, startLON);
                       
            if (start != localEnd)
            {
                int[] routes = cal.GetRouteNumbers(grapgNo, start, localEnd);
                foreach (int r in routes)
                {
                    if (grapgNo == 0)
                        routeLocations = GetFootRoute(r);
                    else
                        routeLocations = GetVehicleRoute(r);

                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                final.Add("outerroutelocations", lst);
            }
            lst.Clear();
            int[] ids = cal.GetDepartmentAndFloor(placeID);
            double[,] floorLocations = GetFloorLocations(ids[0], ids[1]);
            for (int i = 0; i < floorLocations.GetLength(0); i++)
            {
                temp[0] = floorLocations[i, 0];
                temp[1] = floorLocations[i, 1];
                lst.Add(temp);
            }
            final.Add("floorlocations", lst);
            lst.Clear();
            Dictionary<string, double[]> place = GetPlaceWithName(placeID);
            Place pl = new Place();
            foreach (KeyValuePair<string, double[]> pair in place)//only once
            {
                pl.name = pair.Key;
                temp = pair.Value;
                pl.lat = temp[0];
                pl.lon = temp[1];               
            }
            final.Add("place", pl);

            int[] innerRouteSet = cal.GetInnerRouteNumbers(localEnd, placeID);
            int graphNo=0;
            switch (ids[1])
            {
                case 0: graphNo = 2; break;
                case 1: graphNo = 3; break;
                case 2: graphNo = 4; break;
            }
            lst.Clear();
            foreach (int r in innerRouteSet)
            {              
                routeLocations = GetInnerRoute(graphNo,r);

                for (int i = 0; i < routeLocations.GetLength(0); i++)
                {
                    temp[0] = routeLocations[i, 0];
                    temp[1] = routeLocations[i, 1];
                    lst.Add(temp);
                }
            }
            final.Add("innerroutelocations", lst);

            return Json(final);

            //return Json(startLAT + " -- " + startLON + " -- " + placeID + " -- " + method);
        }

        [HttpGet]
        [Route("GetPlaceInOut/{department:int}/{floor:int}/{startLAT:double}/{startLON:double}/{endLAT:double}/{endLON:double}")]
        public IActionResult GetPlaceInOut(int department, int floor,double startLAT, double startLON, double endLAT, double endLON)
        {
            List<double[]> lst = new List<double[]>();
            var final = new Hashtable();
            double[,] routeLocations;
            double[] temp = new double[2];
            Calculations cal = new Calculations();
            int graphNo,V_No;
            switch (floor)
            {
                case 0:
                    graphNo = 2;
                    V_No = Data.innerGraphe_0_Vertices;
                    break;
                case 1:
                    graphNo = 3;
                    V_No = Data.innerGraphe_1_Vertices;
                    break;
                case 2:
                    graphNo = 4;
                    V_No = Data.innerGraphe_2_Vertices;
                    break;
                default:
                    graphNo = 2;
                    V_No = Data.innerGraphe_0_Vertices;
                    break;
            }
            int start = cal.GetNearestVertexNo(V_No, graphNo, startLAT, startLON);
            int[] EntranceAndInnerEnd = cal.FindEnterenceVertexNo(department,floor,startLAT,startLON,endLAT,endLON);
            int innerEnd = EntranceAndInnerEnd[1];
            if (start != innerEnd)
            {
                int[] routes = cal.GetRouteNumbers(graphNo, start, innerEnd);
                foreach (int r in routes)
                {                   
                    routeLocations = GetInnerRoute(graphNo,r); 
                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                final.Add("innerroutelocations", lst);
            }
            lst.Clear();
            double[,] floorLocations = GetFloorLocations(department, floor);         
            for (int i = 0; i < floorLocations.GetLength(0); i++)
            {
                temp[0] = floorLocations[i, 0];
                temp[1] = floorLocations[i, 1];
                lst.Add(temp);
            }
            final.Add("floorlocations", lst);
            int outerStrat = Data.EntranceOuterMatch[EntranceAndInnerEnd[0]];
            int outerEnd= cal.GetNearestVertexNo(Data.footGrapheVertices, 0, endLAT, endLON);
            lst.Clear();
            if (outerStrat != outerEnd)
            {
                int[] routes = cal.GetRouteNumbers(0, outerStrat, outerEnd);
                foreach (int r in routes)
                {
                    routeLocations = GetFootRoute(r);

                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                final.Add("outerroutelocations", lst);
            }
            return Json(final);
        }

        [HttpGet]
        [Route("GetPlaceInIn/{department:int}/{floor:int}/{startLAT:double}/{startLON:double}/{placeID:int}")]
        public IActionResult GetPlaceInIn(int department, int floor,double startLAT, double startLON, int placeID)
        {
            List<double[]> lst = new List<double[]>();
            var final = new Hashtable();
            double[,] floorLocations;
            double[,] routeLocations;
            double[] temp = new double[2];
            Calculations cal = new Calculations();
            int graphNo = 5;
            int start= cal.GetNearestVertexNo(department,floor,Data.CSDepartmentGrapheVertices, graphNo, startLAT, startLON);                        
            int end=0;
            for (int i = 0; i < Data.CSMainPlaceMatch.Length; i++)
                if (Data.CSMainPlaceMatch[i] == placeID)
                {
                    end = i;
                    break;
                }
            if (start != end)
            {
                int[] routes = cal.GetRouteNumbers(graphNo, start, end);
                List<int> zeroFloorRouteSet = new List<int>();
                List<int> stairRouteSet = new List<int>();
                List<int> firstFloorRouteSet = new List<int>();
                List<int> secondFloorRouteSet =  new List<int>();

                //int[] ids = cal.GetDepartmentAndFloor(placeID);
                //according to the department,no of arrays should change
                foreach (int rt in routes)
                {
                    if (Data.CSFloor_0_RouteNumbers.Contains(rt))
                        zeroFloorRouteSet.Add(rt);
                    else if (Data.CSFloor_1_RouteNumbers.Contains(rt))
                        firstFloorRouteSet.Add(rt);
                    else if (Data.CSFloor_2_RouteNumbers.Contains(rt))
                        secondFloorRouteSet.Add(rt);
                    else if (Data.CSStairRouteNumbers.Contains(rt))
                        stairRouteSet.Add(rt);
                }
                foreach (int r in zeroFloorRouteSet)
                {
                    routeLocations = GetInnerRoute(graphNo, r);
                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                if (lst.Count != 0)
                {
                    final.Add("groundfloorrouteset", lst);
                    lst.Clear();
                    floorLocations = GetFloorLocations(department, 0);
                    for (int i = 0; i < floorLocations.GetLength(0); i++)
                    {
                        temp[0] = floorLocations[i, 0];
                        temp[1] = floorLocations[i, 1];
                        lst.Add(temp);
                    }
                    final.Add("groundfloorlocations", lst);
                }
                   
                lst.Clear();
                foreach (int r in firstFloorRouteSet)
                {
                    routeLocations = GetInnerRoute(graphNo, r);
                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                if (lst.Count != 0)
                {
                    final.Add("firstfloorrouteset", lst);
                    lst.Clear();
                    floorLocations = GetFloorLocations(department, 1);
                    for (int i = 0; i < floorLocations.GetLength(0); i++)
                    {
                        temp[0] = floorLocations[i, 0];
                        temp[1] = floorLocations[i, 1];
                        lst.Add(temp);
                    }
                    final.Add("firstfloorlocations", lst);
                }
                lst.Clear();
                foreach (int r in secondFloorRouteSet)
                {
                    routeLocations = GetInnerRoute(graphNo, r);
                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                }
                if (lst.Count != 0)
                {
                    final.Add("secondfloorrouteset", lst);
                    lst.Clear();
                    floorLocations = GetFloorLocations(department, 2);
                    for (int i = 0; i < floorLocations.GetLength(0); i++)
                    {
                        temp[0] = floorLocations[i, 0];
                        temp[1] = floorLocations[i, 1];
                        lst.Add(temp);
                    }
                    final.Add("secondfloorlocations", lst);
                }
                lst.Clear();

                foreach (int r in stairRouteSet)
                {
                    routeLocations = GetInnerRoute(graphNo, r);
                    for (int i = 0; i < routeLocations.GetLength(0); i++)
                    {
                        temp[0] = routeLocations[i, 0];
                        temp[1] = routeLocations[i, 1];
                        lst.Add(temp);
                    }
                    if (Data.CSStairBetwenn_0_1.Contains(r))
                    {
                        final.Add("stairlocations_0_1", lst);
                        lst.Clear();
                    }
                    else if (Data.CSStairBetwenn_1_2.Contains(r))
                    {               
                        final.Add("stairlocations_1_2", lst);
                        lst.Clear();
                    }
                } 
            }
            return Json(final);
        }

        [HttpGet]
        public IActionResult Get()
        {
            //double[] aa = new double[] { 0.122222, 5.55555 };
            //double[] bb = new double[] { 1.122222, 6.55555 };
            //double[] cc = new double[] { 2.122222, 7.55555 };
            //double[] dd = new double[] { 3.122222, 8.55555 };

            //Hashtable ht = new Hashtable();
            ////Hashtable ht1 = new Hashtable();

            //List<double[]> ls1 = new List<double[]>();
            //ls1.Add(aa);
            //ls1.Add(bb);
            //ls1.Add(cc);
            //ls1.Add(dd);

            //ht.Add("floorlocations", ls1);

            ////var placess = new Dictionary<string, double[]>();
            ////placess.Add("Mini Auditorium", new double[] { 0.256935, 2.369856 });
            ////placess.Add("Computer Lab 1", new double[] { 0.256935, 2.369856 });
            ////placess.Add("E Larning", new double[] { 0.256935, 2.369856 });

            //////ht.Add("two", placess);

            //Place pl = new Place()
            //{
            //    name = "Audia",
            //    lat = 0.256981,
            //    lon = 0.856633
            //};

            //Place[] ar = new Place[] { pl, pl, pl };

            //ht.Add("places", ar);

            ////List<double[]> ls2 = new List<double[]>();
            ////ls2.Add(bb);
            ////ls2.Add(cc);
            ////ls2.Add(dd);

            ////List<double[]> ls3 = new List<double[]>();
            ////ls3.Add(bb);
            ////ls3.Add(cc);

            ////var test1 = new Dictionary<string, List<double[]>>();
            ////test1.Add("one", ls1);
            ////test1.Add("two", ls2);
            ////test1.Add("three", ls3);       

            //return Json(ht);

            return Json("Connected..!");
        }

        [HttpPost("{username}/{password}")]
        public IActionResult IdentifyUser(string username, string password)
        {
            if (GetUserIdentity(username,password))
                return Ok();
            else
                return Unauthorized();
            //return Ok();
        }

        [HttpPost]
        public IActionResult RegisterUser([FromBody]User user)
        {
            if (SetUser(user.username,user.email,user.password))
                return Created("https://localhost:44342/API", user.username);
            else
                return BadRequest();
            //return Ok();
        }
    }
}
