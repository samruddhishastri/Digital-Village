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

class Form{
  final String name;
  final String description;
  final String attachmentlink;
  
  Form({this.name, this.description, this.attachmentlink});
  
  factory Form.fromJson(Map<String, dynamic> json) {
    return Form(
      name: json['name'],
      description: json['description'],
      attachmentlink: json['attachmentlink'],
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

Function display_data() {
  for (int i = 0; i < (data.length); i++) {
    DataRow(cells: [
      DataCell(Text('${data[i]["name"].toString()}')),
      DataCell(Text('${data[i]["description"].toString()}')),
      DataCell(
        IconButton(
          icon: new Icon(Icons.download_rounded),
          onPressed: () {
            url_launcher('${data[i]["attachmentlink"].toString()}');
          },
        ),
      ),
    ]);
  }
}

var data;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Future<void> _getData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/view_forms');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // print(response);
      setState(() {
        data = response.body;
      });
    }

    _getData();
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
              display_data();
            ],
          ),
        ]));
  }
}
