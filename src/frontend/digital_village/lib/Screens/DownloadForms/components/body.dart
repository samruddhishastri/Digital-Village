import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> url_launcher(String url) async {
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
