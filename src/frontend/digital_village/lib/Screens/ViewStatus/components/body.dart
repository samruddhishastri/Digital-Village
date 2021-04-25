import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Status'),
        ),
        body: ListView(children: <Widget>[
          DataTable(
            columns: [
              DataColumn(
                  label: Text('Title',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Status',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              // DataColumn(
              //     // label: Text('Email',
              //         style: TextStyle(
              //             fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Description',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Water')),
                DataCell(Text('Working')),
                DataCell(Text('>>>>>>>')),
              ]),
              DataRow(cells: [
                DataCell(Text('Others')),
                DataCell(Text('Resolved')),
                DataCell(Text('abcdef')),
              ]),
              DataRow(cells: [
                DataCell(Text('House')),
                DataCell(Text('Rejected')),
                DataCell(Text(
                    'Hi, .........................................................')),
              ]),
              DataRow(cells: [
                DataCell(Text('Electricity')),
                DataCell(Text('Working')),
                DataCell(Text('---'))
              ]),
            ],
          ),
        ]));
  }
}
