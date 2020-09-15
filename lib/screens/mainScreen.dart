import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receiton/screens/profileScreen.dart';
import 'package:receiton/screens/publishRecipe.dart';
import 'package:mysql1/mysql1.dart';

class mainScreen extends StatefulWidget {

  mainScreen({this.passedEmail});

  final String passedEmail;

  @override
  State createState() => new mainScreenState(passedEmail: passedEmail);

}

class mainScreenState extends State<mainScreen> {
  mainScreenState({this.passedEmail});

  final String passedEmail;
  var username;





  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return FutureBuilder(
      future: getUser(context, passedEmail),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Scaffold(
              appBar: new AppBar(
                backgroundColor: Color(0xFFF57F17),
                title: new Text('Receitas'),
              ),
              drawer: new Drawer(
                child: ListView(
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      accountName: new Text(snapshot.data),
                      //IR BUSCAR USER E EMAIL A BASE DE DADOS
                      accountEmail: new Text(passedEmail),
                      currentAccountPicture: new CircleAvatar(
                        //backgroundImage ADICIONAR DA BASE DE DADOS
                        backgroundColor: Colors.white,
                      ),

                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xFFF57F17), Color(0xFFF9A825)])),

                    ),
                    Column(
                      children: <Widget>[
                        new ListTile(
                          title: new Text('PUBLICAR RECEITA',
                            style: GoogleFonts.kanit(
                                fontSize: 20,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    publishRecipe()));
                          },
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 5,
                        ),
                        new ListTile(
                          title: new Text('OS NOSSOS NUTRICIONISTAS',
                            style: GoogleFonts.kanit(
                                fontSize: 20,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            //Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => publishRecipe()));
                          },
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 5,
                        ),
                        new ListTile(
                          title: new Text('MARCAS PARCEIRAS',
                            style: GoogleFonts.kanit(
                                fontSize: 20,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            //Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => publishRecipe()));
                          },
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 5,
                        ),

                        Column(
                          children: <Widget>[
                            new ListTile(
                              title: new Text('O MEU PERFIL',
                                style: GoogleFonts.kanit(
                                    fontSize: 20,
                                    color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              leading: Icon(
                                  Icons.perm_identity, color: Colors.black),

                              onTap: () {
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        profileScreen()));
                              },
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black26,
                          height: 5,
                        ),
                      ],


                    ),

                  ],

                ),
              ),

            );
          }
        } else {
          return new CircularProgressIndicator();
        }
      }

    );
  }
}

class User {
  String username;
  String email;

  User({this.email, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}

Future <String> getUser(BuildContext context, String passedEmail) async {


  var url = 'https://unironed-hardcopy.000webhostapp.com/get_username.php';

  // Store all data with Param Name.
  var data = {'email': passedEmail};

  // Starting Web API Call.
  http.Response response = await http.post(url, body: json.encode(data));

  // Getting Server response into variable.
  var username = jsonDecode(response.body.toString());


  print(username);

  return username;

  // If Web call Success than Hide the CircularProgressIndicator.
}