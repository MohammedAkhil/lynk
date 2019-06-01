import 'package:flutter/material.dart';

class Host extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Host Vehicle.'),
        ),
        body: Column(
          children: <Widget>[buildLocationDate()],
        ));
  }

  Center buildLocationDate() {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12, top: 24),
            child: Text('Geeky Ants Software Limited',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
          ),
          Text('01-05-2019 05:00 P.M',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ))
        ],
      ),
    );
  }

  Center buildTypeWidget() {
    return Center(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('motorcycle.png'))),
              ),
              Text('Car')
            ],
          ),
          Column(
            children: <Widget>[Text('bike')],
          )
        ],
      ),
    );
  }
}
