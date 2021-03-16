import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Profession',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              // DataColumn(
              //     // label: Text('Email',
              //         style: TextStyle(
              //             fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Mobile No',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Stephen')),
                DataCell(Text('Sarpanch')),
                // DataCell(Text('abc@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.phone),
                    onPressed: () {
                      _makePhoneCall('tel:0597924917');
                    },
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(Text('John')),
                DataCell(Text('VRO')),
                // DataCell(Text('xyz@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.phone),
                    onPressed: () {
                      _makePhoneCall('tel:0597924917');
                    },
                  ),
                )
              ]),
              DataRow(cells: [
                DataCell(Text('Harry')),
                DataCell(Text('Doctor')),
                // DataCell(Text('mno@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.phone),
                    onPressed: () {
                      _makePhoneCall('tel:0597924917');
                    },
                  ),
                )
              ]),
              DataRow(cells: [
                DataCell(Text('Peter')),
                DataCell(Text('Electrician')),
                // DataCell(Text('pqr@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.phone),
                    onPressed: () {
                      _makePhoneCall('tel:0597924917');
                    },
                  ),
                )
              ]),
            ],
          ),
        ]));
  }
}
