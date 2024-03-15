import 'package:flutter/material.dart';
// import 'package:designs/pages/homepage.dart';

class form_demo1 extends StatefulWidget {
  const form_demo1({Key? key}) : super(key: key);

  @override
  _form_demo1State createState() => _form_demo1State();
}

class _form_demo1State extends State<form_demo1> {
  bool? check1 = false;
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String _loginMessage = '';
  String text ="hello";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: "lexend-bold",
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.1,
                          blurRadius: 15,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'please enter name';
                          }
                          String pattern="[a-z][A-Z]";
                          var emailRegExp=RegExp(pattern);
                          if(!emailRegExp.hasMatch(value!)){
                            return "please enter valid name";
                          }
                          return null;
                        },
                        controller: _username,
                        cursorColor: Colors.blue,
                        style: TextStyle(fontFamily: "lexend-bold"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'User Name',
                        ),

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.1,
                          blurRadius: 15,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'please enter passward';
                          }
                          String pattern="[a-z][A-Z]";
                          var emailRegExp=RegExp(pattern);
                          if(!emailRegExp.hasMatch(value!)){
                            return "please enter valid name";
                          }
                          return null;
                        },
                        controller: _password,
                        cursorColor: Colors.blue,
                        style: TextStyle(fontFamily: "lexend-bold"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: check1,
                            activeColor: Colors.blue,
                            onChanged: (bool? value) {
                              setState(() {
                                check1 = value;
                              });
                            },
                          ),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                              fontFamily: "lexend-medium",
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontFamily: "lexend-medium",
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String username = _username.text;
                    String password = _password.text;

                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        text=_username.text;
                        text=_password.text;
                      });
                      print('Login successful');
                    }
                    else{
                      setState(() {
                        _loginMessage = 'Login failed';
                      });
                      print('Login failed');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: "lexend-medium",
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.blue,
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontFamily: "lexend-medium",
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.blue,
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Sign In With",
                    style: TextStyle(
                      fontFamily: "lexend-medium",
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 7),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                "assets/images/facebook.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7, right: 15),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Image.asset(
                              "assets/images/google.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontFamily: "lexend-medium",
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        " Sign up",
                        style: TextStyle(
                          fontFamily: "lexend-medium",
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
