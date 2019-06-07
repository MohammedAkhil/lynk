import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Event extends StatelessWidget {
  final DocumentSnapshot event;

  const Event({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          this.event['name'],
          style: TextStyle(
            fontSize: 28,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildLocationDate(),
                buildAttendeeList(context),
                buildHosts(context),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: buildJoin(),
          )
        ],
      ),
    );
  }

  Center buildLocationDate() {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12, top: 24),
            child: Text(this.event['location'],
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

  buildAttendeeList(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 40),
          child: Text('attendees - 3',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 0,
            color: Color(0xfff9f9ff),
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 24, top: 8),
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Akhil Mohammed',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Samuvel Johnson',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Krishna Pravin',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54)),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  buildHosts(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Text('hosts',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800)),
        ),
        Container(
            margin: EdgeInsets.only(left: 16),
            child: Container(
              child: Center(
                  child: Text('No hosts yet.\nBecome a host!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.black26))),
              margin: EdgeInsets.all(48),
            ))
      ],
    );
  }

  buildJoin() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: MaterialButton(
        color: Color(0xff0d00ff),
        height: 60,
        child: Text('Host',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        onPressed: () => {print('hello')},
      ),
    );
  }
}
