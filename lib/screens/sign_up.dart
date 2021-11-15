import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'home_screen.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  // Login({ required Key key,  required this.title}) : super(key: key);
  // final String title;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "";
  String password = "";

  void signUpUser() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['email']=email;
    map['password']=password;

    http.post(
      Uri.parse('http://localhost:8000/trello/sign_up'),
      body: map,
    ).then((response) {
      Map<String, dynamic> map = response.headers;
      if (map['email']!.isEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      return response;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      onChanged: (text) {
        this.email = text;
      },
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      onChanged: (text) {
        this.password = text;
      },
    );

    final sighupButton = Container(
      constraints: BoxConstraints(minWidth: 150, maxWidth: 200, minHeight: 40),
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        onPressed: () {
          signUpUser();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue.shade800, // background
          // foreground
        ),
        // padding: EdgeInsets.all(12),
        // color: Colors.blue,
        child: const Text('Sign Up',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final loginButton = Container(
      constraints: const BoxConstraints(minWidth: 50, maxWidth: 80),
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue.shade800, // background
          // foreground
        ),
        // padding: EdgeInsets.all(12),
        // color: Colors.blue,
        child: const Align(
          alignment: Alignment.center,
          child: Text('Log in',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlue.shade50,
          ),
          Center(
            child: Card(
              elevation: 1.0,
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 400,
                    minHeight: 520,
                    maxHeight: 600),
                padding: const EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 62.0),
                    const Center(
                        child: Text(
                      "Trello",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 20.0),
                    const Center(
                        child: Text(
                      "Signup For Free",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 30.0),
                    email,
                    const SizedBox(height: 8.0),
                    password,
                    const SizedBox(height: 8.0),
                    password,
                    const SizedBox(height: 40.0),
                    sighupButton,
                    const SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[Text("Already a member?")],
                        ),
                        loginButton,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
