import 'package:flutter/material.dart';

class circleavter extends StatelessWidget{
 final String imagename;
 final String text;
  const circleavter ({super.key, required this.imagename, required this.text});

  
  @override
  Widget build(BuildContext context) {
   return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10,top: 10),
                        child: CircleAvatar(
                          backgroundImage:AssetImage( "$imagename"),
                          radius: 35,
                        )
                      ),
                      Text("$text",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  );
  }}