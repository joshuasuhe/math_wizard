import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_wizard_mk2/Kelas2/quiz2411.dart';
import 'package:math_wizard_mk2/Kelas2/quiz2421.dart';
import 'package:math_wizard_mk2/Kelas2/quiz2431.dart';

class pilihlatihankelas2bab4 extends StatefulWidget {
  @override
  _pilihlatihankelas2bab4State createState() => _pilihlatihankelas2bab4State();
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

class _pilihlatihankelas2bab4State extends State<pilihlatihankelas2bab4> {
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
                stream: Firestore.instance.collection("Kurikulum").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Text('Loading data.....');
                  return Text(
                    snapshot.data.documents[1]['BAB4'],
                    style: TextStyle(fontFamily: "Poppins-bold", fontSize: 15),
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
                                height: 200,
                                width: 200,
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
                                                        .document('Kelas 2')
                                                        .collection(
                                                            "BAB4 Bangun Datar Sederhana")
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (!snapshot.hasData)
                                                        return Text(
                                                            'Loading data.....');
                                                      return Text(
                                                        snapshot.data
                                                                .documents[0]
                                                            ['sub1'],textAlign: TextAlign.center,
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
                                                        return Quiz2411();
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
                                    image: AssetImage("assets/img/pyramid.png"),
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
                                height: 200,
                                width: 200,
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
                                                        .document('Kelas 2')
                                                        .collection(
                                                            "BAB4 Bangun Datar Sederhana")
                                                        .snapshots(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (!snapshot.hasData)
                                                        return Text(
                                                            'Loading data.....');
                                                      return Text(
                                                        snapshot.data
                                                                .documents[0]
                                                            ['sub2'],textAlign:TextAlign.center,
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
                                                        return Quiz2421();
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
                                          "assets/img/angle.png")),
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
                                height: 200,
                                width: 200,
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
                                                        .document('Kelas 2')
                                                        .collection(
                                                            "BAB4 Bangun Datar Sederhana")
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
                                                          fontSize: 20,
                                                        ),
                                                      );
                                                    }),
                                                color: Colors.cyan,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return Quiz2431();
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
                                      image:
                                          AssetImage("assets/img/cube.png")),
                                ),
                              ),
                            ]),
                      )))),
                ]))));
  }
}
