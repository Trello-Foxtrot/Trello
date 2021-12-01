import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';
import 'package:trello/globals.dart' as globals;

import 'login_screen.dart';
import 'main_screen.dart';

class SignUp extends StatefulWidget {
  // Login({ required Key key,  required this.title}) : super(key: key);
  // final String title;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  String _emailErr = "";
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  void signUpUser() {
    Map<String, String> map = <String, String>{};
    map['email'] = _email.text;
    map['password'] = _pass.text;

    globals.Session.post(
      'trello/sign_up',
      map
    ).then((resMap) {
      if (resMap['email'].isEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
      else {
        _emailErr = resMap['email'];
        _form.currentState!.validate();
        _emailErr = "";
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an email';
        }
        if (_emailErr.isNotEmpty) {
          return _emailErr;
        }
        return null;
      },
    );

    final sighupButton = Container(
      constraints: BoxConstraints(minWidth: 150, maxWidth: 200, minHeight: 40),
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        onPressed: () {
          if (_form.currentState!.validate()) {
            signUpUser();
          }
        },
        style: ElevatedButton.styleFrom(primary: darkBlue, shape: StadiumBorder()),
        child: const Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
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
        style: ElevatedButton.styleFrom(primary: darkBlue, shape: StadiumBorder()),
        child: const Align(
          alignment: Alignment.center,
          child: Text('Log in', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
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
                constraints: const BoxConstraints(minWidth: 300, maxWidth: 400, minHeight: 550, maxHeight: 600),
                padding: const EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Form(
                  key: _form,
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
                      // PASSWORD 1   ----------------------------------
                      TextFormField(
                        controller: _pass,
                        autofocus: false,
                        //initialValue: '',
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0),
                      // PASSWORD 2   ----------------------------------
                      TextFormField(
                          controller: _confirmPass,
                          autofocus: false,
                          //initialValue: '',
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (_confirmPass.text != _pass.text) {
                              return "Password does not match";
                            }
                            return null;
                          }),
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
          ),
        ],
      ),
    );
  }
}
