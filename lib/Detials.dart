import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:finalistta/Fristpage.dart';
import 'package:finalistta/cardpage.dart';
// import 'package:finalistta/cardpage.dart';
import 'package:finalistta/homepage.dart';
import 'package:finalistta/packages/apptextfilled.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Detials extends StatefulWidget {
  final data;
  const Detials({super.key, this.data});
  @override
  State<Detials> createState() => Mydetials();
}

class Mydetials extends State<Detials> {
  TextEditingController size = TextEditingController();
    TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          iconSize: 25,
          selectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "Market"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "ME"),
          ]),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title:
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.shopping_cart_outlined),
          Text(
            " Market",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ),
      endDrawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(27),
          child: ListView(
            children: [
              Row(
                children: [
                  DrawerHeader(
                    child:
                    Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      child: Image.asset(
                        "images/background.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), ),
                  const Expanded(
                    child: ListTile(
                      title: Text("Wham"),
                      subtitle: Text("wham@gmail.com"),
                    ),
                  )
                ],
              ),
              ListTile(
                title: Text("homepage"),
                leading: Icon(Icons.home_filled),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => homepage()));
                },
              ),
              ListTile(
                title: Text("Order"),
                leading: Icon(Icons.check_box),
                onTap: () {},
              ),
              ListTile(
                title: Text("payment"),
                leading: Icon(Icons.payment_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text("contact us"),
                leading: Icon(Icons.phone),
                onTap: () {},
              ),
              ListTile(
                title: Text("sign out"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Fristpage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(height: 400, child: Image.asset(widget.data["imagename"])),
          Container(
            child: Text(
              widget.data["title"],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.data["subtitle"],
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              )),
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                widget.data["price"],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              )),

               Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:AppTextField(
                    datalist: [
                      SelectedListItem(name: "black"),
                      SelectedListItem(name: "white"),
                      SelectedListItem(name: "blue"),
                    ],
                    title: 'select color',
                    hint: 'color',
                    isCitySelected: true,
                    textEditingController: color,
                  ),
              ),

         

          Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:AppTextField(
                    datalist: [
                      SelectedListItem(name: "s"),
                      SelectedListItem(name: "m"),
                      SelectedListItem(name: "l"),
                      SelectedListItem(name: "xl"),
                    ],
                    title: 'select size',
                    hint: 'size',
                    isCitySelected: true,
                    textEditingController: size,
                  ),
              ),

          Container(
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: MaterialButton(
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => cardpage()
                ));
              },
              child: Text("ADD TO CARD"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: MaterialButton(
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Out of stock',
                  desc: '  No longer on shop.............',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                )..show();
              },
              child: Text("BUY NOW"),
            ),
          ),
        ],
      ),
    );
  }
}
