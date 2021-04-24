import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Future<void> url_launcher(String url) async {
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
    Future<void> _getData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/view_contacts');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Download Forms'),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                  label: Text('Title',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Description',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Download',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Title1')),
                DataCell(Text('Description1')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.download_rounded),
                    onPressed: () {
                      url_launcher('http://flutter.dev');
                    },
                  ),
                ),
              ]),
              DataRow(cells: [
                DataCell(Text('Title2')),
                DataCell(Text('Description2')),
                // DataCell(Text('xyz@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.download_rounded),
                    onPressed: () {
                      url_launcher('http://flutter.dev');
                    },
                  ),
                )
              ]),
              DataRow(cells: [
                DataCell(Text('Title3')),
                DataCell(Text('Description3')),
                // DataCell(Text('mno@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.download_rounded),
                    onPressed: () {
                      url_launcher('http://flutter.dev');
                    },
                  ),
                )
              ]),
              DataRow(cells: [
                DataCell(Text('Title4')),
                DataCell(Text('Description4')),
                // DataCell(Text('pqr@gmail.com')),
                DataCell(
                  IconButton(
                    icon: new Icon(Icons.download_rounded),
                    onPressed: () {
                      url_launcher('http://flutter.dev');
                    },
                  ),
                )
              ]),
            ],
          ),
        ]));
  }
}
