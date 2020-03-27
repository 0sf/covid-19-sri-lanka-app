import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _hPad = 16.0;

  NumberWidget(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 16.0, _hPad, 4.0),
          child: Text(
            _title,
            style: Theme.of(context).textTheme.title,
          ),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 16.0, _hPad, 4.0),
          child: Text(
            _body,
            style: Theme.of(context).textTheme.body1,
          ),
        ),
      ],
    );
  }
}
