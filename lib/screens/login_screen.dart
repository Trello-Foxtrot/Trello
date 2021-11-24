import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trello/screens/signup_screen.dart';
import 'package:trello/utils/colors.dart';

import 'main_screen.dart';

class Login extends StatefulWidget {
  // Login({ required Key key,  required this.title}) : super(key: key);
  // final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void loginUser() {

    Map<String, dynamic> map = new Map<String, dynamic>();
    map['email'] = _login.text;
    map['password'] = _password.text;

    http
        .post(
      Uri.parse('http://localhost:8000/trello/login'),
      body: map,
    )
        .then((response) {
      Map<String, dynamic> map = response.headers;
      if (map['email']!.isEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
      else {
        SnackBar snackBar = SnackBar(
           content:
           Text(map['email']),
           backgroundColor: Colors.red,
         );
         ScaffoldMessenger.of(context)
             .showSnackBar(snackBar);
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
        style:
            ElevatedButton.styleFrom(primary: darkBlue, shape: StadiumBorder()),
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
            color: Colors.lightBlue.shade50,
          ),
          Center(
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 300,
                    maxWidth: 400,
                    minHeight: 520,
                    maxHeight: 540),
                padding: const EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Form(
                  key: _formKey,
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
                      // EMAIL TEXT FIELD -------------------------------------
                      TextFormField(
                        controller: _login,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0),
                      // PASSWORD TEXT FIELD ----------------------------------
                      TextFormField(
                        controller: _password,
                        autofocus: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40.0),
                      // LOG IN BUTTON ---------------------------------------
                      Container(
                        constraints: const BoxConstraints(
                            minWidth: 150, maxWidth: 200, minHeight: 40),
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginUser();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => MainScreen()),
                              // );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: darkBlue, shape: StadiumBorder()),
                          child: const Text('Log In',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
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
          ),
        ],
      ),
    );
  }
}
