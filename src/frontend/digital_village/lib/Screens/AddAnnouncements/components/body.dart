import 'package:flutter/material.dart';
import 'package:temp/Screens/Dashboard/dashboard.dart';
import 'package:temp/components/rounded_dropdown_field.dart';
import '../../Dashboard/dashboard.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

var title, description, link, format, ret, retCode;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Future<void> _sendData() async {
      DateTime now = new DateTime.now();
      DateTime tenDaysLater = now.add(const Duration(days: 10));
      DateTime date =
          new DateTime(tenDaysLater.year, tenDaysLater.month, tenDaysLater.day);
      var dateTime = DateTime.parse(date.toString());
      var formate2 = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
      var url = Uri.parse('http://20.62.249.138/api/add_announcement');
      var response = await http.post(url, body: {
        "name": title,
        "description": description,
        "link": link,
        "validtill": formate2,
        "format": format,
      });
      setState(() {
        ret = response.body;
        retCode = response.statusCode;
      });
      print(retCode);
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Add new Announcement",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Title",
                icon: Icons.title_rounded,
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              RoundedInputField(
                hintText: "Description",
                icon: Icons.wysiwyg_outlined,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              RoundedInputField(
                hintText: "Link.",
                icon: Icons.link_rounded,
                onChanged: (value) {
                  setState(() {
                    link = value;
                  });
                },
              ),
              DropDownField(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: format,
                  style: TextStyle(color: Colors.black),
                  items: <String>['pdf', 'mp3', 'mp4']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose a format",
                  ),
                  onChanged: (String value) {
                    setState(() {
                      format = value;
                    });
                  },
                ),
              ),
              RoundedButton(
                text: "Add Announcement",
                press: () async {
                  await _sendData();
                  if (retCode == 201) {
                    final snackBar = SnackBar(
                        content: Text("Added Announcement!"),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (ret == null) {
                    ;
                  } else {
                    final snackBar = SnackBar(
                        content: Text(
                            "Failure in adding announcement. Please ensure all the field are filled correctly."),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              // SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
