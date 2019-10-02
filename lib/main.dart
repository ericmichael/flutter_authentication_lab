import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  Future<String> login(String username, String password) async {
    //try to login to https://sleepy-hamlet-97922.herokuapp.com/api/login

    //if successful, that is, status is 200
    //parse the response
    //return the token

    //if not successful return null
  }

  Future<String> getSecretMessage(String token) async {
    //try to retrieve secret
    //set HttpHeaders.authorizationHeader to Bearer token
   
    //if successful, that is, status is 200
    //parse the response
    //return the secret message
    //if not successful, return null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: usernameCtrl,
          ),
          TextField(
            controller: passwordCtrl,
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () async {
              //Try to login and retrieve token
              String token = await login(usernameCtrl.text, passwordCtrl.text);

              //if token is valid
              if (token != null) {

                //try to fetch the secret info
                String secret = await getSecretMessage(token);

                //if successfully retrieved
                if (secret != null) {

                  //navigate to MainScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen(secret)),
                  );
                }
              }
            },
          ),
          RaisedButton(
            child: Text("Register"),
            onPressed: () {
              //navigate to
              //MainScreen("Secret constructor message")

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainScreen("Secret constructor message")),
              );
            },
          )
        ],
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  String secretMessage;

  MainScreen(this.secretMessage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confidential"),
      ),
      body: Text(secretMessage),
    );
  }
}
