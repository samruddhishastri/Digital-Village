import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Future<List> _getData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/view_contacts');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

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
