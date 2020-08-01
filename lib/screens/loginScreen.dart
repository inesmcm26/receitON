import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget {
  @override
  State createState() => new loginScreenState();

}

class loginScreenState extends State<loginScreen> with SingleTickerProviderStateMixin {

  /*AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 2000),
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Opacity(
              opacity: 0.1,
              child: Image(
                image: new AssetImage("assets/pasta.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            new Theme(
              data: new ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.cyan,
                inputDecorationTheme: new InputDecorationTheme(
                  labelStyle: new TextStyle(
                    color: Colors.cyan, fontSize: 20
                  )
                )
              ),
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
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              hintText: ('Password'),
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
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

                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => mainScreen())
                      ),
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
          ],
        ),
      ),
    );
  }
}

