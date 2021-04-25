import 'package:flutter/material.dart';
import 'package:temp/Screens/Dashboard/dashboard.dart';
import '../../Dashboard/dashboard.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import 'package:http/http.dart' as http;

var title, description, link, ret, retCode;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _sendData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/add_form');
      var response = await http.post(url, body: {
        "title": title,
        "description": description,
        "link": link,
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
                "Upload Forms",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Title",
                icon: Icons.title_rounded,
                onChanged: (value) {
                  title = value;
                },
              ),
              RoundedInputField(
                hintText: "Description",
                icon: Icons.wysiwyg_outlined,
                onChanged: (value) {
                  description = value;
                },
              ),
              RoundedInputField(
                hintText: "Link.",
                icon: Icons.link_rounded,
                onChanged: (value) {
                  link = value;
                },
              ),
              RoundedButton(
                text: "Upload Form",
                press: () async {
                  await _sendData();
                  if (retCode == 201) {
                    final snackBar = SnackBar(
                        content: Text("Upload Successful"),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (ret == null) {
                    ;
                  } else {
                    final snackBar = SnackBar(
                        content: Text(ret),
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
