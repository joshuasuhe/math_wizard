import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_wizard_mk2/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_wizard_mk2/ubahAvatar.dart';
import 'package:path/path.dart';
import 'package:math_wizard_mk2/about.dart';
import 'package:math_wizard_mk2/login.dart';
import 'package:math_wizard_mk2/auth_services.dart';
import 'package:math_wizard_mk2/database_services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'contact.dart';
import 'edit_profile.dart';
import 'globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imagePath;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
   
        body: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/pattern.jpg"), fit: BoxFit.cover)),
      ),
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 350.0,
              width: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.cyan,
                boxShadow: [new BoxShadow(blurRadius: 10.0)],
                // borderRadius: new BorderRadius.vertical(
                //     bottom: new Radius.elliptical(
                //         MediaQuery.of(context).size.width, 50.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:15),
                  globals.currentaccountemail == null
                      ? Text(
                          globals.currentaccountgoogle,
                          style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 22),
                        )
                      : Text(
                          globals.currentaccountemail,
                          style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 22),
                        ),
                        SizedBox(height:15),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 150.0,
                          height: 150.0,
                          child: (globals.currentimageemail == null)
                              ? Image.network(
                                  globals.currentimagegoogle,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  globals.currentimageemail,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
                    padding: EdgeInsets.symmetric(),
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChangeAvatar();
                        }));
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text(
                        'UBAH AVATAR',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                                                   Image.asset(
                                'assets/trophy.png',
                                width: 40,
                                height: 40,
                              ),
                              globals.currentemailscore == null
                                  ? Text(
                                      globals.currentgooglescore.toString(),
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium", fontSize: 18),
                                    )
                                  : Text(
                                      globals.currentemailscore.toString(),
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium", fontSize: 18),
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/coin.png',
                                width: 40,
                                height: 40,
                              ),
                                globals.currentemailcoin == null
                                  ? Text(
                                      globals.currentgooglecoin.toString(),
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium", fontSize: 18),
                                    )
                                  : Text(
                                      globals.currentemailcoin.toString(),
                                      style: TextStyle(
                                          fontFamily: "Poppins-Medium", fontSize: 18),
                                    ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: <Widget>[
               
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditProfileScreen();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [new BoxShadow(blurRadius: 3.0)],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 75,
                      width: 350,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Ubah Profil',
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 15),
                          ),
                          SizedBox(
                            width: 205,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactScreen();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [new BoxShadow(blurRadius: 3.0)],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 75,
                      width: 350,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Hubungi Kami',
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 15),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AboutScreen();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [new BoxShadow(blurRadius: 3.0)],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 75,
                      width: 350,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Tentang Math Wizard',
                            style: TextStyle(
                                fontFamily: 'Poppins-Medium', fontSize: 15),
                          ),
                          SizedBox(
                            width: 125,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 350,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(),
                    width: 350,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        AuthProvider().logOut();
                    Alert(
              context: context,
              type: AlertType.success,
              title: "Signout Berhasil",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  })),
                  width: 120,
                )
              ],
            ).show();
                        
                      },
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.red,
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      )
    ]));
  }

}
