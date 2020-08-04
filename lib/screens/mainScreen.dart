import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receiton/screens/profileScreen.dart';
import 'package:receiton/screens/publishRecipe.dart';
import 'package:mysql1/mysql1.dart';

class mainScreen extends StatefulWidget {
  @override
  State createState() => new mainScreenState();

}

class mainScreenState extends State<mainScreen> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: new AppBar(
        title: new Text('Receitas'),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: new Text('Username'),
              //IR BUSCAR USER E EMAIL A BASE DE DADOS
              accountEmail: new Text('email'),
              currentAccountPicture: new CircleAvatar(
                //backgroundImage ADICIONAR DA BASE DE DADOS
                backgroundColor: Colors.white,
              ),
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
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => publishRecipe()));
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
                        leading: Icon(Icons.perm_identity, color: Colors.black),

                        onTap: () {
                          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => profileScreen()));
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
  
}