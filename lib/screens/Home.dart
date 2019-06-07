import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lynk/screens/Event.dart';
import 'package:lynk/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  final String userId;
  Home({Key key, @required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your events',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 32),
        ),
        actions: <Widget>[
          FlatButton(
            child: new Text('Logout'),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('events').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return _buildEventCard(context, document);
                }).toList(),
              );
          }
        },
      )),
    );
  }

  Padding _buildEventCard(BuildContext context, document) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Event(
                        event: document,
                      ))),
          child: Card(
            elevation: 0,
            color: Color(0xfff9f9ff),
            child: Stack(
              children: <Widget>[
                _buildHostView(context),
                _buildHostCount(document),
                _buildDate(document),
                _buildNameLocation(document),
              ],
            ),
          ),
        ));
  }

  Container _buildNameLocation(document) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              document['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Text(
              document['location'],
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

  Positioned _buildDate(document) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Text(document['startDate'].toString().split(' ')[0],
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff828282))),
    );
  }

  Positioned _buildHostCount(document) {
    return Positioned(
      top: 24,
      right: 16,
      child: Text(
        document['users'].length.toString() + " host(s)",
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

  _logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setString("authStatus", "NOT_LOGGED_IN");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }
}
