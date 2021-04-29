import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Future<void> url_launcher(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Form {
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

class _BodyState extends State<Body> {
  // Future<List<Forms>> getd;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  List docList;
  int len = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Of Forms'),
          backgroundColor: Colors.orange[300],
        ),
        body: ListView.builder(
          itemCount: len,
          itemBuilder: (context, index) {
            print(docList[index].runtimeType);
            if (docList[index] != null) {
              return Forms(req: (docList[index]));
            } else {
              return Container();
            }
          },
        ));
  }

  getData() async {
    var url = Uri.parse('http://20.62.249.138/api/view_forms');
    final response = await http.get(url);

    List temp = jsonDecode(response.body);
    print(temp);
    setState(() {
      docList = temp;
      len = temp.length;
    });
  }
}

class Forms extends StatelessWidget {
  var req;
  Forms({this.req});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 2),
        child: Card(
            shape:
                Border(left: BorderSide(color: Colors.orange[300], width: 5)),
            margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
            child: Column(children: <Widget>[
              ListTile(
                isThreeLine: true,
                title: Text(req['name']),
                subtitle: Text(req['description']),
                trailing: IconButton(
                  icon: Icon(Icons.download_rounded),
                  onPressed: () => {url_launcher(req['attachmentlink'])},
                ),
              ),
            ])));
  }
}
