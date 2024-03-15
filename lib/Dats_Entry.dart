import 'package:demo2/User_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database/my_database.dart';

class DataEntry extends StatefulWidget {
  Map<String,Object?>? map;
  DataEntry(map){
    this.map = map;
  }

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  var nameController = TextEditingController();
  void initState(){
    nameController.text=widget.map==null?'':widget.map!["Name"].toString();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("add data")),
        body: SafeArea(
          child: Card(
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "Enter User Name"),
                  ),
                ),
                Center(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        // insertDB()
                        //     .then((value) => Navigator.of(context).pop(true))
                        //     .then(
                        //   (value) {
                        //     return User_list();
                        //   },
                        // );
                        if(widget.map==null){
                         await insertDB().then((value) => Navigator.of(context).pop(true));
                        }
                        else{
                         await editUser(widget.map!["UserID"].toString()).then((value) => Navigator.of(context).pop(true));
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<int> insertDB() async {
    Map<String, Object?> map = Map<String,Object?>();
    map["Name"] = nameController.text;
    // map["Name"];
    var res = await MyDatabase().insertRecord(map);
    return res;
  }
  Future<int> editUser(id) async {
    Map<String, Object?> map = Map<String, Object?>();
    map["Name"]=nameController.text;
    // map["CityId"]=cityIdController.text;

    var res = await MyDatabase().editUser(map, id);
    return res;
  }
}
