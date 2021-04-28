import 'package:flutter/material.dart';
import '../../../Screens/Login/components/background.dart';

import '../../Dashboard/dashboard.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_password_field.dart';
import '../../../components/rounded_input_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

var passwd, confirmPasswd, ret, retCode, username, currPasswd;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _sendData() async {
      var url = Uri.parse('http://20.62.249.138/api/reset_password');
      var response = await http.post(url, body: {
        "username": username,
        "curr_password": currPasswd,
        "password": passwd,
        "confirmpassword": confirmPasswd,
      });
      setState(() {
        ret = response.body;
        retCode = response.statusCode;
      });
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Reset Password",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              icon: Icons.wysiwyg_outlined,
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            RoundedPasswordField(
              text: "Current Password",
              onChanged: (value) {
                currPasswd = value;
              },
            ),
            RoundedPasswordField(
              text: "Password",
              onChanged: (value) {
                passwd = value;
              },
            ),
            RoundedPasswordField(
              text: "Confirm Password",
              onChanged: (value) {
                confirmPasswd = value;
              },
            ),
            RoundedButton(
              text: "Reset Password",
              press: () async {
                await _sendData();
                if (retCode == 201) {
                  final snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("Updated Password!"),
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
                          "Updating Password failed! Please ensure that all the fields are correctly filled."),
                      action: SnackBarAction(
                        label: "Close",
                        onPressed: () {},
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
