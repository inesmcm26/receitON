import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget {
  @override
  State createState() => new loginScreenState();

}
class loginScreenState extends State<loginScreen> {

  // For CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final emailC = TextEditingController();
  final passwordC = TextEditingController();


  Future userLogin() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String email = emailC.text;
    String password = passwordC.text;

    // SERVER LOGIN API URL
    var url = 'https://unironed-hardcopy.000webhostapp.com/login_user.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if(message == 'Login Matched')
    {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mainScreen())
      );
    }else{

      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

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
      );}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
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
                      children: <Widget>[
                        Padding (
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Login',
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
                                    hintText: ('Password'),
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: passwordC,
                                ),

                              ],
                            ),
                          ),
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
                              userLogin();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('ENTRAR ',
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
                ),
            ],
          ),
    );
  }
}