import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_wizard_mk2/login.dart';
import 'package:math_wizard_mk2/signup.dart';
import 'package:math_wizard_mk2/ranking.dart';
import 'package:math_wizard_mk2/profile.dart';
import 'package:math_wizard_mk2/quiz_page.dart';
import 'package:math_wizard_mk2/utilities/constants.dart';
import 'package:math_wizard_mk2/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'Bab 6/quiz3611.dart';
import 'Bab 6/quiz3621.dart';
import 'Bab 6/quiz3631.dart';

class pilihlatihankelas3bab6 extends StatefulWidget {
  @override
  _pilihlatihankelas3bab6State createState() => _pilihlatihankelas3bab6State();
}

class listDataItem extends StatelessWidget {
  String itemName;
  listDataItem(this.itemName);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Text(itemName[0]),
            ),
            Text(itemName,
                style: TextStyle(fontSize: 15, fontFamily: 'Poppins-Medium'))
          ],
        ),
      ),
    );
  }
}

class _pilihlatihankelas3bab6State extends State<pilihlatihankelas3bab6> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
          title: StreamBuilder(
                  stream:
                      Firestore.instance.collection("Kurikulum")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text('Loading data.....');
                    return Text(
                      snapshot.data.documents[4]
                          ['BAB6'],
                      style:
                          TextStyle(fontFamily: "Poppins-bold", fontSize: 15),
                    );
                  }),
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Colors.cyan),
            )),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/img/body.png"),
                  fit: BoxFit.cover,
                )),
                child:
                    ListView(scrollDirection: Axis.vertical, children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          child: new FittedBox(
                              child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Container(
                                width: 200,
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: StreamBuilder(
                                                    stream: Firestore.instance
                                                        .collection("Kurikulum")
                                                        .document('Kelas3')
                                                        .collection(
                                                            "BAB6 Pecahan")
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (!snapshot.hasData)
                                                        return Text(
                                                            'Loading data.....');
                                                      return Text(
                                                        snapshot.data
                                                                .documents[0]
                                                            ['sub1'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Poppins-Medium",
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      );
                                                    }),
                                                color: Colors.cyan,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return Quiz3611();
                                                      },
                                                    ),
                                                  );
                                                }))
                                      ]),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(24.0),
                                  child: Image(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                    image: AssetImage("assets/img/pencil.png"),
                                  ),
                                ),
                              ),
                            ]),
                      )))),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          child: new FittedBox(
                              child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                           
                                         Container(
                                width: 200,
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: StreamBuilder(
                                                    stream: Firestore.instance
                                                        .collection("Kurikulum")
                                                        .document('Kelas3')
                                                        .collection(
                                                            "BAB6 Pecahan")
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (!snapshot.hasData)
                                                        return Text(
                                                            'Loading data.....');
                                                      return Text(
                                                        snapshot.data
                                                                .documents[0]
                                                            ['sub2'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Poppins-Medium",
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      );
                                                    }),
                                              
                                                color: Colors.cyan,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return Quiz3621();
                                                      },
                                                    ),
                                                  );
                                                })),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(24.0),
                                  child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.topRight,
                                      image: AssetImage(
                                          "assets/img/equal.png")),
                                ),
                              ),
                            ]),
                      )))),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          child: new FittedBox(
                              child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                          Container(
                                width: 200,
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          18.0),
                                                ),
                                                child: StreamBuilder(
                                                    stream: Firestore.instance
                                                        .collection("Kurikulum")
                                                        .document('Kelas3')
                                                        .collection(
                                                            "BAB6 Pecahan")
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (!snapshot.hasData)
                                                        return Text(
                                                            'Loading data.....');
                                                      return Text(
                                                        snapshot.data
                                                                .documents[0]
                                                            ['sub3'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Poppins-Medium",
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      );
                                                    }),
                                                color: Colors.cyan,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return Quiz3631();
                                                      },
                                                    ),
                                                  );
                                                })),
                                      ]),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(24.0),
                                  child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.topRight,
                                      image: AssetImage(
                                          "assets/img/pie-chart.png")),
                                ),
                              ),
                            ]),
                      )))),
                      
                ]))));
  }
}