import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class cardpage extends StatefulWidget{
@override
State<cardpage> createState()=> cardpage1();
}

class cardpage1 extends State<cardpage> {

  List data=[];
  bool loading=false;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.grey,
      title: Text("card page",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent),),
    ),
    body: Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.green,
            child: MaterialButton(
              onPressed:()async{
                loading=true;
                setState(() {});
             var response= await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));  
              var jsonreponse=jsonDecode(response.body);
              data.addAll(jsonreponse);
              loading=false;
              setState(() {
                
              });
            },child: Text("recive data from sever",style: TextStyle(color: Colors.amber,fontSize: 20),)),
          ),
          if (loading) 
          Center(child: CircularProgressIndicator(),),
          ...List.generate(data.length, (index) => Card(child:ListTile(title:Text('${data[index]["title"]}'),
          subtitle: Text("body ${data[index]["body"]}"),) ))
        ],
      ),
    ),
  );
  }
  

}