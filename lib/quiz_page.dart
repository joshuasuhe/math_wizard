import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_wizard_mk2/Kelas1/quiz1112.dart';
import 'package:flutter/services.dart';
import 'package:math_wizard_mk2/login.dart';
import 'package:math_wizard_mk2/signup.dart';
import 'package:math_wizard_mk2/ranking.dart';
import 'package:math_wizard_mk2/profile.dart';
import 'package:math_wizard_mk2/utilities/constants.dart';
import 'package:math_wizard_mk2/category.dart';
import 'package:math_wizard_mk2/success_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:random_string/random_string.dart';

class halamankuis extends StatefulWidget {
  @override
  _halamankuisState createState() => _halamankuisState();
}

class _halamankuisState extends State<halamankuis> {
  Map<String, Color> btnColor = {
    "salah1": Colors.cyan[50],
    "salah2": Colors.red[300],
    "benar1": Colors.cyan[50],
    "benar2": Colors.green[300],
  };

  var random = new Random();
  int option1 = 7;
  int option2 = randomBetween(5, 6);
  int option3 = randomBetween(8, 9);

  void jawabanSalah() {
    setState(() {
      btnColor["benar1"] = btnColor["benar2"];
      btnColor["salah1"] = btnColor["salah2"];
    });
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz1112();
          },
        ),
      );
    });
  }

  void jawabanBenar() {
    setState(() {
      btnColor["benar1"] = btnColor["benar2"];
      btnColor["salah1"] = btnColor["salah2"];
      Timer(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz1112();
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Latihan",
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins-Bold')),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/img/body.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text("SOAL NOMOR 1",
                style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 20)),
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(3),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //////////////////////////////
                  ///          SOAL          ///
                  //////////////////////////////
                  Text(
                    "Lambang bilangan tujuh adalah...",
                    style:
                        TextStyle(fontFamily: "Poppins-Medium", fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                  height: double.infinity,
                  margin: new EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          jawabanBenar();
                        },
                        child: Text(option1.toString(),
                            textAlign: TextAlign.center),
                        padding: EdgeInsets.all(5),
                        minWidth: 300,
                        height: 50,
                        color: btnColor["benar1"],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        onPressed: () {
                          jawabanSalah();
                        },
                        child: Text(option2.toString(),
                            textAlign: TextAlign.center),
                        padding: EdgeInsets.all(5),
                        minWidth: 300,
                        height: 50,
                        color: btnColor["salah1"],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        onPressed: () {
                          jawabanSalah();
                        },
                        child: Text(option3.toString(),
                            textAlign: TextAlign.center),
                        padding: EdgeInsets.all(5),
                        minWidth: 300,
                        height: 50,
                        color: btnColor["salah1"],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  )),
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   child: RaisedButton.icon(
            //     color: Colors.cyan,
            //     icon: Icon(Icons.navigate_next),
            //     label: Text(
            //       'Next',
            //       style: TextStyle(
            //           color: Colors.white, fontFamily: 'Poppins-Medium'),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) {
            //             return successpage();
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Row(
              children: <Widget>[
                // new Text(docRef.toString())
              ],
            )
          ],
        ),
      )),
    );
  }
}
