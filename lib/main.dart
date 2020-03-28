import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services.dart';
import 'item.dart';
import 'alert.dart';
// import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<NewState> stat;

  @override
  void initState() {
    super.initState();
    stat = fetchAlbum();
  }

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  bool isSwitched = false;
  bool showMenu = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'covid-19 status sri lanka',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              showMenu = !showMenu;
            });
          },
          child: Icon(
            Icons.info_outline,
          ),
          heroTag: "demoTag",
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(children: [
                Text(
                  'COVID19',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Situation Report',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w200),
                ),
                FutureBuilder<NewState>(
                  future: stat,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Wrap(
                        spacing: 17,
                        runSpacing: 17,
                        children: [
                          Text(
                            snapshot.data.data.updateTime.toString(),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
                Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Local',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w200),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.blue,
                        inactiveTrackColor: Colors.lightBlueAccent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text('Global',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w200)),
                    ]),
                FutureBuilder<NewState>(
                  future: stat,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && !isSwitched && !showMenu) {
                      return Wrap(
                        spacing: 17,
                        runSpacing: 17,
                        children: [
                          Item(
                              title: snapshot.data.data.totLocalCases
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Total Cases",
                              color: 0xffFED525),
                          Item(
                              title: snapshot.data.data.activeCases
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Active Cases",
                              color: 0xffF54A8E),
                          Item(
                              title: snapshot.data.data.newCases
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "New Cases",
                              color: 0xff6F52F8),
                          Item(
                              title: snapshot.data.data.localRecovered
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Recovered",
                              color: 0xff56CA8D),
                          Item(
                              title: snapshot.data.data.inHospital
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "In Hospital",
                              color: 0xff33A3EA),
                          Item(
                              title: snapshot.data.data.localDeaths
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Total Deaths",
                              color: 0xffEA3347),
                        ],
                      );
                    }
                    if (snapshot.hasData && isSwitched && !showMenu) {
                      return Wrap(
                        spacing: 17,
                        runSpacing: 17,
                        children: [
                          Item(
                              title: snapshot.data.data.totGlobalCases
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Total Cases",
                              color: 0xffFED525),
                          Item(
                              title: snapshot.data.data.globalNewDeaths
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "New Deaths",
                              color: 0xffF54A8E),
                          Item(
                              title: snapshot.data.data.globalNewCases
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "New Cases",
                              color: 0xff33A3EA),
                          Item(
                              title: snapshot.data.data.globalRecovered
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Recovered",
                              color: 0xff56CA8D),
                          Item(
                              title: snapshot.data.data.globalDeaths
                                  .toString()
                                  .replaceAllMapped(reg, mathFunc),
                              subtitle: "Total Deaths",
                              color: 0xffEA3347),
                        ],
                      );
                    }
                    if (snapshot.hasData && showMenu) {
                      return AlertInfo();
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ])),
        ),
      ),
    );
  }
}
