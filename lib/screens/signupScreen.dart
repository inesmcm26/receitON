import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainScreen.dart';

class signupScreen extends StatefulWidget {
  @override
  State createState() => new signupScreenState();

}

class signupScreenState extends State<signupScreen>{

  TextEditingController usernameC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController passwordC = new TextEditingController();
  TextEditingController repeatPassC = new TextEditingController();

  bool visible = false;

  Future userRegistration() async {
    setState(() {
      visible = true;
    });

    String username = usernameC.text;
    String email = emailC.text;
    String password = passwordC.text;
    String repeatPassword = repeatPassC.text;

    var url = 'https://unironed-hardcopy.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {'username': username, 'email': email, 'password' : password, 'repeatPassword' : repeatPassword};


    // Starting Web API Call.
    http.Response response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body.toString());


    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    if (message[0] == 'U') {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => mainScreen())
      );
    });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body:  Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
                    image: new AssetImage('assets/quesadillas.jpg')),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                    Padding (
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text('Sign Up',
                                      style: GoogleFonts.varelaRound(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                              AnimatedContainer(
                                width: 75,
                                child: new CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50.0,
                                  child: Icon(
                                    Icons.perm_identity,
                                    color: Colors.cyan,
                                    size: 50,
                                  ),
                                ),
                                duration: new Duration(milliseconds: 500),
                                curve: Curves.bounceOut,
                              ),
                              new Form(
                                child: Container(
                                  padding: const EdgeInsets.all(30.0),
                                  child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                  new TextFormField(
                                  decoration: new InputDecoration(
                                      hintText: ('O seu email'),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                controller: emailC,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: ('Username'),
                                ),
                                keyboardType: TextInputType.text,
                                maxLength: 50,
                                controller: usernameC,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: ('Password'),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: passwordC,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: ('Confirme a Password'),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: repeatPassC,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: new FlatButton(
                                        color: Colors.cyan,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.cyan,
                                              width: 1,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.circular(80.0),
                                        ),

                                      onPressed: () {
                                        userRegistration();
                                      },
                          child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('COMEÇAR! ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.check_circle_outline,
                                color: Colors.white,
                                size: 30),
                                           ],
                                        ),
                                      ),
                                    ),
                                   ],
                                 ),
                               ),
                            )
                         ],
                       ),
                    ),
                  ),
              ],
      ),
    );
  }
}

