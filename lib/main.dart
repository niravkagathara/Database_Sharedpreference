import 'package:demo2/User_list.dart';
// import '../../../api/lib/apiuser_list.dart';
import 'package:demo2/form_demo_login_validation_regex.dart';
import 'package:demo2/design_login.dart';
import 'package:demo2/navdemo.dart';
import 'package:demo2/shared.dart';
import 'package:demo2/tab1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: NavDemo(),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              print('DATA IN PREFERENCE :::: ${snapshot.data!.getString('ScreenName')}');
              return snapshot.data!.getString('ScreenName') != null
                  ? NavDemo()
                  : Shared();
            } else {
              return Shared();
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
