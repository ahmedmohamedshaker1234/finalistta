import 'package:finalistta/detials.dart';
import 'package:finalistta/widgets/circleavter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const homepage());
}

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => Myhomepage();
}

class Myhomepage extends State<homepage> {
  List items = [
    {
      "imagename": "images/t-shirt.jpg",
      "title": "New Flash Jacket",
      "subtitle": "BLACK MAD-TED ",
      "price": "320\$"
    },
    {
      "imagename": "images/t-shirt6.jpg",
      "title": "DOUBLE-STARshirt",
      "subtitle": "DOUBLE-STAR",
      "price": "700\$"
    },
    {
      "imagename": "images/t-shirt2.jpg",
      "title": "New Flash Jacket",
      "subtitle": "BLACK MAD-TED ",
      "price": "800\$"
    },
    {
      "imagename": "images/t-shirt3.jpg",
      "title": "NEW SHIRT",
      "subtitle": "FLASH TSHIET",
      "price": "55\$"
    },
    {
      "imagename": "images/t-shirt4.jpg",
      "title": "MAD-TED Jacket",
      "subtitle": "MAD-TED",
      "price": "200\$"
    },
    {
      "imagename": "images/t-shirt6.jpg",
      "title": "NWE SHIRT",
      "subtitle": "MAD-TED Jacket",
      "price": "400\$"
    },
    {
      "imagename": "images/p1.jpeg",
      "title": "NEW jeans ",
      "subtitle": "Black",
      "price": "400\$"
    },
    {
      "imagename": "images/p2.jpeg",
      "title": "NEW jeans ",
      "subtitle": "Light Blue",
      "price": "400\$"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          iconSize: 25,
          selectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "Market"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Me"),
          ]),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                      hintText: "search",
                      fillColor: Colors.grey[250],
                      filled: true,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.menu),
                )
              ],
            ),
            Container(
              height: 30,
            ),
            const Text(
              "Catagiors",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(height: 20),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  circleavter(imagename: "images/imageman.jpg", text: "men"),
                  circleavter(
                      imagename: "images/imagewoman1.jpg", text: "women"),
                  circleavter(imagename: "images/imagekid.jpg", text: "kides"),
                  circleavter(imagename: "images/imagebag.jpg", text: "bags"),
                  circleavter(imagename: "images/imageacc.jpg", text: "acc"),
                  circleavter(imagename: "images/imageshoe.jpg", text: "shoes"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Super Deals",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 235),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detials(data: items[i])));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            color: Colors.grey[100],
                            child: Image.asset(
                              items[i]["imagename"],
                              height: 160,
                            ),
                          ),
                          Text(
                            items[i]["title"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(items[i]["subtitle"],
                              style: TextStyle(color: Colors.grey[150])),
                          Text(items[i]["price"],
                              style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  );
                })
          ])),
    );
  }
}


