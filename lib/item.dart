import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final String subtitle;
  final dynamic color;

  Item({this.title, this.subtitle, this.color});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: (screenWidth - 40 - 17) / 2,
      height: (screenWidth - 40 - 17 - 30) / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(color),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
        ),
        Text(title,
            style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        Text(subtitle,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400))
      ]),
    );
  }
}
