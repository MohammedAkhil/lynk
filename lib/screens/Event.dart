import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Flutter hackathon',
          style: TextStyle(
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

  buildAttendeeList(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 40),
          child: Text('attendees',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800)),
        ),
        Container(
          height: 120,
          margin: EdgeInsets.only(left: 24, top: 8),
          child: ListView(
            children: <Widget>[
              Text('Akhil',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  )),
              Text('Akhil',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
              Text('Akhil',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800))
            ],
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
                  fontSize: 20,
                  fontWeight: FontWeight.w800)),
        ),
        Container(
            margin: EdgeInsets.only(left: 16), child: Text('no hosts yet.'))
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
