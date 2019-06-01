import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final String userId;
  Home({Key key, @required this.userId }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Your events'),
       ),
       body: Container(
           child: StreamBuilder<QuerySnapshot>(
             stream: Firestore.instance.collection('events').snapshots(),
             builder: (BuildContext context,
                 AsyncSnapshot<QuerySnapshot> snapshot) {
               if (snapshot.hasError)
                 return new Text('Error: ${snapshot.error}');
               switch (snapshot.connectionState) {
                 case ConnectionState.waiting:
                   return new Text('Loading...');
                 default:
                   return new ListView(
                     children: snapshot.data.documents
                         .map((DocumentSnapshot document) {
                     return _buildEventCard(context, document);
                     }).toList(),
                   );
               }
             },
           )
       ),
     );
   }

  Padding _buildEventCard(BuildContext context, document) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Stack(
          children: <Widget>[
            _buildHostView(context),
            _buildHostCount(document),
            _buildDate(document),
            _buildNameLocation(document),
          ],
        ),
      ),
    );
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

  Positioned _buildDate(document) {
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

  Positioned _buildHostCount(document) {
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
