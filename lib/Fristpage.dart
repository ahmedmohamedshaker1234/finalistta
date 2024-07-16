import 'package:finalistta/homepage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Fristpage extends StatefulWidget{
const Fristpage ({super.key});

 @override 
 State<Fristpage> createState()=> Myfristpage();
}

class Myfristpage extends State<Fristpage>{

//==============================================================
  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
//=================================================================================================

  @override
  Widget build(BuildContext context) {
  return Scaffold( 
    backgroundColor: Colors.grey[190],
    body: Container(
      child: Column(
        children: [
          Container(
            height: 430,
            child: Image.asset("images/brand2.png")),
             Container(

              padding: EdgeInsets.only(top: 10,right: 70,left: 10),
              child: Text("EXPLORE \THE BEST\ PRODUCTS" ,style: TextStyle(
                fontSize: 50,
                fontFamily: "Righteous"
              ),),
            ), 
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child:  
                  MaterialButton(onPressed: (){
                    Navigator.of(context).push((MaterialPageRoute(builder:(context)=> homepage())));

                  },child: Text("Next",style: TextStyle(color: Colors.white,fontFamily: 'jersy'),),),
                )
                
              ],
            )     
        ],
      ),
    ),

  );
  }
}