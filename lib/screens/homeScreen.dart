import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receiton/screens/signupScreen.dart';
import './loginScreen.dart';


class HomeScreen extends StatelessWidget  {

@override
  Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    backgroundColor: Colors.cyan,
    appBar: AppBar(
      title: Text('ReceitON'),
      backgroundColor: Colors.white,
    ),
    body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.cyan, Color(0xFF80DEEA)])),
        alignment: Alignment.center,
          child: Container(

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
                        color: Colors.cyan
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 25),
                    child: Container(
                      width: 200,
                      height: 40,
                      child: FlatButton(


                        onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => loginScreen(),)
                        ),


                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.cyan,
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
                                color: Colors.cyan,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 200,
                      height: 40,
                    child: FlatButton(

                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => signupScreen(),)
                      ),
                      color: Colors.cyan,
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
  );
  }
}