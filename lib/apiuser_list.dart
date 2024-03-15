import 'apicode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListAPI extends StatefulWidget {
  const UserListAPI({super.key});

  @override
  State<UserListAPI> createState() => _UserListAPIState();
}

class _UserListAPIState extends State<UserListAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: FutureBuilder(
        future: APICode().getdetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Row(
                    children: [
                      Text(snapshot.data![index]["name"]),
                      IconButton(onPressed: () async {
                        await APICode().deletRecord(snapshot.data![index]["id"]).then((value) {setState(() {});});

                      }, icon: Icon(Icons.delete)),
                    ]
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
          // return CircularProgressIndicator();
        },
      ),
    );
  }
}
