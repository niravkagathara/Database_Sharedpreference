// import 'dart:html';
import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with TickerProviderStateMixin {
  TabController? tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.grey,
            child: ListView(
              children: [
                DrawerHeader(child: Container(
                  child: Image.network("https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D"),
                )
                ),
                ListTile(title: Text("Home"),trailing: Icon(Icons.home),),
                ListTile(title: Text("balance"),trailing: Icon(Icons.account_balance_outlined),),
                ListTile(title: Text("power"),trailing: Icon(Icons.offline_bolt),),
                ListTile(title: Text("Contect"),trailing: Icon(Icons.call),),
              ],
            ),
          ),

          appBar: AppBar(
            title: Title(
                color: Colors.blueAccent,
                child: Text("data")
            ),
            actions: [
              IconButton(onPressed: () {
                  showDialog(context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Data not found"),
                          actions: [
                            ElevatedButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: Text("ok")),

                            ElevatedButton(onPressed: () {
                              Navigator.of(context).pop();
                            }, child: Text("cancle")),
                          ],
                        );
                      },);
              }, icon: Icon(Icons.data_object)
              )
            ],
            backgroundColor: Colors.blueAccent,
            bottom: TabBar(
                controller:tabcontroller,
                tabs:[
                  Tab(text:"page1"),
                  Tab(text:"page2"),
                  Tab(text:"page3")
                ],
            ),
          ),
          body: TabBarView(controller: tabcontroller,
          children: [
            Center(child: Text("1")),
            Center(child: Text("2")),
            Center(child: Text("3")),
          ]),
        )
    );
  }
  }