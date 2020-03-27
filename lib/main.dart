import 'package:flutter/material.dart';
import 'services.dart';
import 'number_widget.dart';
import 'style.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'covid-19 status sri lanka',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: AppBarStyle),
        ),
        textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle,
        ),
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('covid-19 Sri Lanka'),
        ),
        body: Center(
          child: FutureBuilder<NewState>(
            future: stat,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(snapshot.data.data.updateDateTime.toString()),
                    NumberWidget(snapshot.data.data.newCases.toString(), "Number of New cases"),
                    NumberWidget(snapshot.data.data.localRecovered.toString(), "Number of Recovered"),
                    NumberWidget(snapshot.data.data.totCases.toString(), "Total Number of Cases"),
                    NumberWidget(snapshot.data.data.localDeaths.toString(), "Total Death Count"),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}