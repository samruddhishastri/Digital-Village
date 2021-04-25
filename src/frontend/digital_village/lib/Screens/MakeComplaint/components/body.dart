import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Dashboard/dashboard.dart';
import '../components/background.dart';
import 'package:temp/components/rounded_dropdown_field.dart';
import 'package:temp/components/rounded_dropdown_category.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

var dropdownValue, title, description, link, ret, retCode, notes;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _sendData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/make_complaint');
      var response = await http.post(url, body: {
        "name": title,
        "description": description,
        "attachment_link": link,
        "category": dropdownValue,
        "notes": notes,
      });
      setState(() {
        ret = response.body;
        retCode = response.statusCode;
      });
    }

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Citizen Complaint Entry",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {
                  title = value;
                },
              ),
              DropDownField(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  style: TextStyle(color: Colors.black),
                  items: <String>['water', 'electricity', 'house', 'others']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose a category",
                  ),
                  onChanged: (String value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                ),
              ),
              RoundedInputField(
                hintText: "Complaint Description",
                icon: Icons.description,
                onChanged: (value) {
                  description = value;
                },
              ),
              RoundedInputField(
                hintText: "Add Link",
                icon: Icons.link_rounded,
                onChanged: (value) {
                  link = value;
                },
              ),
              RoundedInputField(
                hintText: "Notes",
                icon: Icons.description,
                onChanged: (value) {
                  notes = value;
                },
              ),
              RoundedButton(
                text: "Submit",
                press: () async {
                  await _sendData();
                  if (retCode == 201) {
                    final snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("Your complaint is registered!"),
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
                            "Registration of complaint failed! Please ensure that all the fields are correctly filled."),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              // SizedBox(height: size.height * 0.03)
              //
            ],
          ),
        ),
      ),
    );
  }
}
