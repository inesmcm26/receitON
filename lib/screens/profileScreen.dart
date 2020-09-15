import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class profileScreen extends StatefulWidget {
  @override
  State createState() => new profileScreenState();
}


class profileScreenState extends State<profileScreen> {

  TextEditingController myNameController = TextEditingController()..text = 'Nome'; //BASE DE DADOS
  TextEditingController myEmailController = TextEditingController()..text = 'Email';

  bool _NameButtonTextEnabled = false;
  bool _EmailButtonTextEnabled = false;


  Container MyRecipes(String imageVal, String title) {
    /*IR BUSCAR AS FOTOS À BASE DE DADOS*/
    return Container(
      width: 200,
      child: Card (
        child: Wrap(
          children: <Widget>[
            Container(
              constraints: new BoxConstraints.expand(height:300),
              alignment: Alignment.bottomLeft,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage(imageVal),
                colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
                fit: BoxFit.cover)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: 200,
                  decoration: new BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: Text(title,
                    style: GoogleFonts.varelaRound(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Container MyFavorites(String imageVal, String title, String author) {
    /*IR BUSCAR AS FOTOS À BASE DE DADOS*/
    return Container(
      width: 200,
      child: Card (
        child: Wrap(
          children: <Widget>[
            Container(
              constraints: new BoxConstraints.expand(height:300),
              alignment: Alignment.bottomLeft,
              decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage(imageVal),
                      colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
                      fit: BoxFit.cover)
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: 200,
                  decoration: new BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(title,
                          style: GoogleFonts.varelaRound(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        Text('@'+author,
                          style: GoogleFonts.varelaRound(
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold (
      appBar: new AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFFF57F17),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Padding (
                      padding: EdgeInsets.all(20),
                      child: Icon (Icons.account_circle,
                      size: 150),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: new Column (
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                constraints: BoxConstraints(minWidth: 120, minHeight: 30),
                                child: TextField(
                                  enabled: _NameButtonTextEnabled,
                                  controller: myNameController,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(60.0)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlatButton(
                              color: null,
                                onPressed: () {
                                  setState(() {
                                    if (_NameButtonTextEnabled) {
                                      _NameButtonTextEnabled = false;

                                    }
                                    else {
                                      _NameButtonTextEnabled = true;
                                    }
                                  });
                                },
                              child: _NameButtonTextEnabled ? Icon(Icons.check, color: Color(0xFFF57F17),) : Icon(Icons.edit, color: Color(0xFFF57F17),),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextField(
                                  controller: myEmailController,
                                  enabled: _EmailButtonTextEnabled,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(60.0)
                                      )
                                  ),
                                )
                              ),
                            ),
                            FlatButton(
                              color: null,
                              onPressed: () {
                                setState(() {
                                  if (_EmailButtonTextEnabled) {
                                    _EmailButtonTextEnabled = false;

                                  }
                                  else {
                                    _EmailButtonTextEnabled = true;
                                  }
                                });
                              },
                              child: _EmailButtonTextEnabled ? Icon(Icons.check, color: Color(0xFFF57F17),) : Icon(Icons.edit, color: Color(0xFFF57F17),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
              child: Text('AS MINHAS RECEITAS ',
                style: GoogleFonts.kanit(
                    fontSize: 20,
                    color: Color(0xFFF57F17)),
                textAlign: TextAlign.left,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container (
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MyRecipes('assets/pasta.jpg', 'Nome'),
                    MyRecipes('assets/quesadillas.jpg', 'Nome'),
                    MyRecipes('assets/pasta.jpg', 'Nome'),
                    MyRecipes('assets/quesadillas.jpg', 'Nome'),
                    MyRecipes('assets/pasta.jpg', 'Nome'),
                    MyRecipes('assets/quesadillas.jpg', 'Nome'),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
              child: Text('AS MINHAS FAVORITAS ',
                style: GoogleFonts.kanit(
                    fontSize: 20,
                    color: Color(0xFFF57F17)),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MyFavorites('assets/quesadillas.jpg', 'Nome', 'Zé'),
                    MyFavorites('assets/pasta.jpg', 'Nome', 'Maria'),
                    MyFavorites('assets/quesadillas.jpg', 'Nome', 'Manel'),
                    MyFavorites('assets/quesadillas.jpg', 'Nome', 'Zé'),
                    MyFavorites('assets/pasta.jpg', 'Nome', 'Maria'),
                    MyFavorites('assets/quesadillas.jpg', 'Nome', 'Manel'),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }


}