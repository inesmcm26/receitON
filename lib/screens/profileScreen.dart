import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.dstATop),
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
            Opacity(
              opacity: 0.5,
              child: Image(
                image: new AssetImage(imageVal),
              ),
            ),
            ListTile(
              title: Text(title,
                style: TextStyle(
                    fontSize: 20
                ),),
              subtitle: Text(author,
              style: TextStyle(
                fontSize: 20
              ),),
            ),
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[
                  Padding (
                    padding: EdgeInsets.all(20),
                    child: Icon (Icons.account_circle,
                    size: 150),
                  ),
                  new Column (
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: TextField(
                                enabled: _NameButtonTextEnabled,
                                controller: myNameController,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                selectionWidthStyle: BoxWidthStyle.max,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(60.0)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                              child: FlatButton(
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
                                child: _NameButtonTextEnabled ? Icon(Icons.check, color: Colors.cyan,) : Icon(Icons.edit, color: Colors.cyan,),
                              )
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: 150,
                              child: TextField(
                                controller: myEmailController,
                                enabled: _EmailButtonTextEnabled,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                selectionWidthStyle: BoxWidthStyle.max,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(60.0)
                                    )
                                ),
                              ),
                            )
                          ),
                          SizedBox(
                              width: 65,
                              child: FlatButton(
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
                                child: _EmailButtonTextEnabled ? Icon(Icons.check, color: Colors.cyan,) : Icon(Icons.edit, color: Colors.cyan,),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 10),
              child: Text('AS MINHAS RECEITAS ',
                style: GoogleFonts.kanit(
                    fontSize: 20,
                    color: Colors.cyan),
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
                    color: Colors.cyan),
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