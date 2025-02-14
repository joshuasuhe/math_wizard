import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_wizard_mk2/Kelas2/quiz2212.dart';
import 'package:math_wizard_mk2/Kelas2/quiz2222.dart';
import 'package:random_string/random_string.dart';
import 'package:math_wizard_mk2/globals.dart' as globals;

class Quiz2221 extends StatefulWidget {
  @override
  _Quiz2221State createState() => _Quiz2221State();
}

class _Quiz2221State extends State<Quiz2221> {
  Map<String, Color> btnColor = {
    "option": Colors.cyan[50],
    "salah2": Colors.red[300],
    "benar2": Colors.green[300],
  };

  var random = new Random();
  var var1 = randomBetween(50, 100);
  var var2 = randomBetween(50, 100);
  String option1;
  String option2;
  String option3;

  void jawabanSalah() {
    // showSimpleNotification(
    //   Text("Jawaban Salah!"),
    //   background: Colors.red[300],
    // );
    setState(() {
      Timer(Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz2222();
            },
          ),
        );
      });
    });
  }

  void jawabanBenar() {
    // showSimpleNotification(
    //   Text("Jawaban Benar!"),
    //   background: Colors.green,
    // );
    setState(() {
      globals.currentbenar = globals.currentbenar + 1;
      Timer(Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz2222();
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> soal = [var1.toString() , "+", var2.toString()];
    option1 = "02.00";
    option2 = "00.20";
    option3 = "20.00";
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
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
            SizedBox(height: 20),
            Text("SOAL NOMOR 1",
                style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 20)),
            Container(
              height: 275,
              width: 350,
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
                  Image.network("https://firebasestorage.googleapis.com/v0/b/tes1-baa07.appspot.com/o/SOAL%2FKelas2%2FBAB2_PengukuranPanjangBerat%2Fsub2%2Fsoal1-4.png?alt=media&token=107418a0-3094-4343-adc2-5f2d849f1054", height: 200, width: 200,),
                  Text(
                    "Gambar jam A menunjukan pukul",
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
                          jawabanSalah();
                        },
                        child: Text(option2,
                            textAlign: TextAlign.center),
                        padding: EdgeInsets.all(5),
                        minWidth: 300,
                        height: 50,
                        color: btnColor["option"],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        onPressed: () {
                          jawabanBenar();
                        },
                        child: Text(option1,
                            textAlign: TextAlign.center),
                        padding: EdgeInsets.all(5),
                        minWidth: 300,
                        height: 50,
                        color: btnColor["option"],
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
                        child: Text(option3,
                            textAlign: TextAlign.center),
                        padding: EdgeInsets.all(5),
                        minWidth: 300,
                        height: 50,
                        color: btnColor["option"],
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
    ));
  }
}
