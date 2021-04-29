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
  final id;
  const Body({Key key, this.id}) : super(key: key);

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

  getData() async {
    var url = Uri.parse(
        'http://20.62.249.138/api/detail_complaint/' + widget.id.toString());
    final response = await http.get(url);

    final temp = await jsonDecode(response.body);
    // print(temp);
    setState(() {
      docList = temp;
      len = temp.length;
    });
  }

  @override
  var docList;
  int len = 0;
  Widget build(BuildContext context) {
    // print("Entered2");
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Details'),
        backgroundColor: Colors.orange[300],
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              // name: title, description: description, attachmentlink: link, status: open,
              title: Text("${docList['name']}"),
              subtitle: Text(
                "${docList['status']}",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: IconButton(
                icon: Icon(Icons.link_outlined),
                onPressed: () => {url_launcher(docList['attachmentlink'])},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${docList['description']}",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
