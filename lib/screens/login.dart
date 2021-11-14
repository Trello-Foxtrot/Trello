import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trello/screens/sign_up.dart';

import 'home_screen.dart';

class Login extends StatefulWidget {
  // Login({ required Key key,  required this.title}) : super(key: key);
  // final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Container(
      constraints: BoxConstraints(minWidth: 150, maxWidth: 200, minHeight: 40),
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        // padding: EdgeInsets.all(12),
        // color: Colors.blue,
        child: const Text('Log In',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );

    final sighupButton = Container(
      constraints: const BoxConstraints(minWidth: 50, maxWidth: 80),
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        },
        // padding: EdgeInsets.all(12),
        // color: Colors.blue,
        child: const Align(
          alignment: Alignment.center,
          child: Text('Sign up',
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
            color: Colors.lightBlueAccent,
          ),
          // Column(
          //   children: <Widget>[
          //     Container(
          //       height: MediaQuery.of(context).size.height / 2,
          //       width: MediaQuery.of(context).size.width,
          //       color: Colors.white,
          //     ),
          //     Container(
          //       height: MediaQuery.of(context).size.height / 2,
          //       width: MediaQuery.of(context).size.width,
          //       color: Colors.blue,
          //     ),
          //   ],
          // ),
          Center(
            child: Card(
              elevation: 1.0,
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 400,
                    minHeight: 520,
                    maxHeight: 530),
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
                      "Login",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(height: 30.0),
                    email,
                    const SizedBox(height: 8.0),
                    password,
                    const SizedBox(height: 40.0),
                    loginButton,
                    const SizedBox(height: 60.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Text("Don't have an account?")
                          ],
                        ),
                        sighupButton,
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
