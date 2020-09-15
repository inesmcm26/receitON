import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receiton/screens/profileScreen.dart';
import 'package:receiton/screens/signupScreen.dart';
import 'package:icon_shadow/icon_shadow.dart';
import './loginScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class HomeScreen extends StatefulWidget {
  @override
  State createState() => new homeScreenState();
}

class homeScreenState extends State<HomeScreen> {

  /*Map data;
  List userData;

  Future getData() async{


    var url = 'https://databases-auth.000webhost.com/sql.php?server=1&db=id14526730_users&table=users&pos=0';
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    setState(() {
      userData = data['users'];
    });
    debugPrint(userData.toString());
  }

  @override
  void initState() {
    getData();
  }*/

@override
  Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    backgroundColor: Color(0xFFF57F17),
    appBar: AppBar(
      title: Text('ReceitON'),
      backgroundColor: Colors.white,
    ),
    body: Center(
      child: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFF57F17), Color(0xFFF9A825)])),
            alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(

                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height, maxWidth: MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(

                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          )
                        ]
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('BEM VINDO!',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFF57F17)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[400],
                                      blurRadius: 5.0,
                                    ),
                                  ]
                              ),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: AssetImage('assets/minilogo.PNG'),
                                ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 25),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 200, maxHeight: 40),
                              child: FlatButton(


                                onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => loginScreen(),)
                                ),


                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Color(0xFFF57F17),
                                  width: 1,
                                  style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(80.0),
                                ),

                                padding: EdgeInsets.all(0.00),
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 120, minHeight: 30),
                                  alignment: Alignment.center,
                                  child: Text('ENTRAR',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.kanit(
                                        fontSize: 20,
                                        color: Color(0xFFF57F17),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            constraints: BoxConstraints(maxWidth: 200, maxHeight: 40),
                            child: FlatButton(

                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => signupScreen(),)
                              ),
                              color: Color(0xFFF57F17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                              padding: EdgeInsets.all(0.00),
                              child: Container(
                                constraints: BoxConstraints(minWidth: 120, minHeight: 30),
                                alignment: Alignment.center,
                                child: Text('CRIAR CONTA',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      color: Colors.white,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      ),
    ),
  );
  }

}