import 'dart:io';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receiton/screens/mainScreen.dart';

class publishRecipe extends StatefulWidget {
  @override
  State createState() => new publishRecipeState();
}


class publishRecipeState extends State<publishRecipe>{

  File _image;
  bool _ingredientsTextFieldEnabled = true;
  bool _methodTextFieldEnabled = true;
  String _ingredientsButtonText = 'CONCLUIR';
  String _methodButtonText = 'CONCLUIR';
  bool _VegChecked = false;
  bool _VeganChecked = false;
  bool _KetoChecked = false;
  bool _PaleoChecked = false;
  bool _LowCarbChecked = false;
  bool _GlutenFreeChecked = false;
  bool _DessertChecked = false;
  bool _LunchChecked = false;
  bool _SnackChecked = false;
  bool _DinnerChecked = false;


  //final picker = ImagePicker();

  Future getImage() async {

  final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(() {
  _image = File(pickedFile.path);
  });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: new AppBar(
      title: new Text('Publicar Receita')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: ('Nome da receita'),
                    ),
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: new GestureDetector(
                    onTap:getImage,
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.cyan,
                        width: 1),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: _image == null ? Icon (Icons.add_a_photo, color: Colors.cyan,): Image.file(_image),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text('INGREDIENTES ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(
                      fontSize: 20,
                      color: Colors.cyan,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10, bottom: 20),
                child: Container(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: new TextField(
                      maxLines: 99,
                      enabled: _ingredientsTextFieldEnabled,
                      selectionWidthStyle: BoxWidthStyle.max,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.cyan,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(80.0),
                    ),

                    padding: EdgeInsets.all(0.00),
                    child: Text(_ingredientsButtonText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                          fontSize: 15,
                          color: Colors.cyan,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_ingredientsTextFieldEnabled) {
                          _ingredientsTextFieldEnabled = false;
                         _ingredientsButtonText = 'EDITAR';
                        }
                        else {
                          _ingredientsTextFieldEnabled = true;
                          _ingredientsButtonText = 'CONCLUIR';

                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5.0),
                child: Text('INSTRUÇÕES ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(
                      fontSize: 20,
                      color: Colors.cyan,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10, bottom: 20),
                child: Container(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: new TextField(
                      maxLines: 99,
                      enabled: _methodTextFieldEnabled,
                      selectionWidthStyle: BoxWidthStyle.max,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.cyan,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(80.0),
                    ),

                    padding: EdgeInsets.all(0.00),
                    child: Text(_methodButtonText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                          fontSize: 15,
                          color: Colors.cyan,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_methodTextFieldEnabled) {
                          _methodTextFieldEnabled = false;
                          _methodButtonText = 'EDITAR';
                        }
                        else {
                          _methodTextFieldEnabled = true;
                          _methodButtonText = 'CONCLUIR';
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text('SELECIONE CATEGORIAS ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(
                      fontSize: 20,
                      color: Colors.cyan,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Vegetariano'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _VegChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _VegChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Vegan'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _VeganChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _VeganChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Keto'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _KetoChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _KetoChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Paleo'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _PaleoChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _PaleoChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Low Carb'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _LowCarbChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _LowCarbChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Sem Glúten'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _GlutenFreeChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _GlutenFreeChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Sobermesa'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _DessertChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _DessertChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Almoço'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _LunchChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _LunchChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Snack'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _SnackChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _SnackChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: new CheckboxListTile(
                        title: Text ('Jantar'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _DinnerChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _DinnerChecked = value;
                          });
                        },
                        activeColor: Colors.cyan,
                        checkColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding (
                padding: EdgeInsets.all(40.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 300,
                    child: FlatButton.icon(
                      onPressed: () => Navigator.push(
                        //GUARDAR TUDO NO BACKEND
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => mainScreen(),)
                      ),
                      color: Colors.cyan,

                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      label: Text('PUBLICAR ',
                        style: GoogleFonts.kanit(
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      icon: Icon (Icons.check,
                      color: Colors.white,
                      size: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
      ),
    );
  }

}