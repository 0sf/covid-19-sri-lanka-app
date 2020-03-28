import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(30),
      title: Text('About',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700)),
      content: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(
                'Get information and guidance from WHO regarding the current outbreak of Corona Virus Disease 2019 (COVID19)',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w300)),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Image.asset('assets/images/logo_hpb.png', width: 250.0),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Image.asset('assets/images/logo_who.png', width: 150.0),
          ),
          RichText(
            text: TextSpan(
                text: 'A social service by ',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                children: [
                  TextSpan(
                    text: '0sf',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        launch('https://github.com/0sf');
                      },
                  ),
                  TextSpan(
                    text: ' & ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  TextSpan(
                    text: 'kiwi',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        launch('https://github.com/kiwizu3');
                      },
                  )
                ]),
          ),
        ],
      ),
      // actions: <Widget>[
      //   MaterialButton(
      //     elevation: 5.0,
      //     child: Text('click'),
      //     onPressed: () {},
      //   )
      // ],
    );
  }
}
