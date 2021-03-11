import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              DataColumn(
                  label: Text('Email',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Mobile Number',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Stephen')),
                DataCell(Text('Sarpanch')),
                DataCell(Text('abc@gmail.com')),
                DataCell(Text('1234567890'))
              ]),
              DataRow(cells: [
                DataCell(Text('John')),
                DataCell(Text('VRO')),
                DataCell(Text('xyz@gmail.com')),
                DataCell(Text('6789012345'))
              ]),
              DataRow(cells: [
                DataCell(Text('Harry')),
                DataCell(Text('Doctor')),
                DataCell(Text('mno@gmail.com')),
                DataCell(Text('9876543210'))
              ]),
              DataRow(cells: [
                DataCell(Text('Peter')),
                DataCell(Text('Electrician')),
                DataCell(Text('pqr@gmail.com')),
                DataCell(Text('5123467890'))
              ]),
            ],
          ),
        ]));
  }
}
