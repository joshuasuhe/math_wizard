import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_wizard_mk2/main.dart';
import 'package:math_wizard_mk2/mainPage.dart';
import 'package:math_wizard_mk2/pilih_kelas.dart';
import 'package:math_wizard_mk2/signup.dart';
import 'globals.dart' as globals;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_wizard_mk2/database_services.dart';
import 'package:math_wizard_mk2/kelas1/pilih_bab_kelas1.dart';
import 'package:math_wizard_mk2/login.dart';
import 'package:math_wizard_mk2/materi.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imagePath;

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ;
    return Scaffold(
      body:RefreshIndicator( onRefresh: refreshList,child:  Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/pattern.jpg"), fit: BoxFit.cover)),
              ),
              Container(
                height: 250,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/pattern.png"), fit: BoxFit.cover)),
                decoration: new BoxDecoration(
                  color: Colors.cyan,
                  boxShadow: [new BoxShadow(blurRadius: 10.0)],
                  // borderRadius: new BorderRadius.vertical(
                  //     bottom: new Radius.elliptical(
                  //         MediaQuery.of(context).size.width, 50.0)),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/logo.png'),
                      height: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 350,
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 5.0,
                                // offset: Offset(0.0, 0.75)
                              )
                            ],
                            // borderRadius: new BorderRadius.all(Radius.circular(15)),
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            (globals.currentimageemail == null)
                                ? Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                      image: DecorationImage(
                                          image: NetworkImage(globals.currentimagegoogle),
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                : Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                       image: DecorationImage(
                                          image: NetworkImage(globals.currentimageemail),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                            SizedBox(width: 15),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 15),
                                globals.currentaccountemail == null
                                    ? Text(
                                        globals.currentaccountgoogle,
                                        style:
                                            TextStyle(fontFamily: "Poppins-Medium"),
                                      )
                                    : Text(
                                        globals.currentaccountemail,
                                        style:
                                            TextStyle(fontFamily: "Poppins-Medium"),
                                      ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/trophy.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    globals.currentemailscore == null
                                        ? Text(
                                            globals.currentgooglescore.toString(),
                                            style: TextStyle(
                                                fontFamily: "Poppins-Medium"),
                                          )
                                        : Text(
                                            globals.currentemailscore.toString(),
                                            style: TextStyle(
                                                fontFamily: "Poppins-Medium"),
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/coin.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                      globals.currentemailcoin == null
                                        ? Text(
                                            globals.currentgooglecoin.toString(),
                                            style: TextStyle(
                                                fontFamily: "Poppins-Medium"),
                                          )
                                        : Text(
                                            globals.currentemailcoin.toString(),
                                            style: TextStyle(
                                                fontFamily: "Poppins-Medium"),
                                          ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MateriScreen();
                        }));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Materi\nPelajaran',
                              style:
                                  TextStyle(fontFamily: 'Poppins-Bold', fontSize: 20),
                            ),
                            Image.asset(
                              'assets/materi_book.png',
                            )
                          ],
                        ),
                        height: 125,
                        width: 350,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.orange[200]]),
                            // image: DecorationImage(
                            //   image: AssetImage('assets/image_01.png'),
                            // ),
                            color: Colors.orange[200],
                            boxShadow: [new BoxShadow(blurRadius: 3.0)],
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        padding: EdgeInsets.all(30),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LatihanScreen();
                        }));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Latihan\nSoal',
                              style:
                                  TextStyle(fontFamily: 'Poppins-Bold', fontSize: 20),
                            ),
                            Image.asset(
                              'assets/image_01.png',
                            )
                          ],
                        ),
                        height: 125,
                        width: 350,
                        decoration: BoxDecoration(
                            // image: DecorationImage(
                            //   image: AssetImage('assets/image_01.png'),
                            // ),
                            gradient: LinearGradient(
                                colors: [Colors.lime[200], Colors.white]),
                            // color: Colors.lime[200],
                            boxShadow: [new BoxShadow(blurRadius: 3.0)],
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        padding: EdgeInsets.all(30),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ]), )
           
          );
        }
      
        Future<Null> refreshList()async {
          await Future.delayed(Duration(seconds: 2));
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainPage();}));

  }
}
