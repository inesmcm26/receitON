import 'package:flutter/material.dart';
import 'package:receiton/screens/profileScreen.dart';
import 'package:receiton/screens/publishRecipe.dart';

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
            new ListTile(
              title: new Text('Publicar Receita',
              style: new TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => publishRecipe()));
              },
            ),
            new ListTile(
              title: new Text('O meu Perfil',
                style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                ),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => profileScreen()));
              },
            ),
          ],

        ),
      ),

    );
  }
  
}