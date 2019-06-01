import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your events',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildEventCard(context),
            _buildEventCard(context),
            _buildEventCard(context),
          ],
        ),
      ),
    );
  }

  Padding _buildEventCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        color: Color(0xfff9f9ff),
        child: Stack(
          children: <Widget>[
            _buildHostView(context),
            _buildHostCount(),
            _buildDate(),
            _buildNameLocation(),
          ],
        ),
      ),
    );
  }

  Container _buildNameLocation() {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Flutter Hackathon',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Text(
              'Geekyants pvt limited',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff828282)),
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildDate() {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Text('26/12/16',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff828282))),
    );
  }

  Positioned _buildHostCount() {
    return Positioned(
      top: 24,
      right: 16,
      child: Text(
        '2 hosts',
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xff828282)),
      ),
    );
  }

  Positioned _buildHostView(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      child: Text(
        'you are a host',
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
