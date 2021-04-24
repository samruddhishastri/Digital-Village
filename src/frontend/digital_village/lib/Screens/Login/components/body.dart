import 'package:flutter/material.dart';
import '../../../Screens/Login/components/background.dart';
import '../../Signup/signup_screen.dart';
import '../../Dashboard/dashboard.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var username, password, ret, retCode;

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _sendData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/login');
      var response = await http.post(url, body: {
        "username": username,
        "password": password,
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
              "LOGIN",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              icon: Icons.person,
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            RoundedPasswordField(
              text: "Password",
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                await _sendData();
                if (retCode == 201) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Dashboard();
                      },
                    ),
                  );
                } else if (retCode == 400) {
                  final snackBar = SnackBar(
                      content: Text("Invalid username or password"),
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
                          "Couldn't log in. Please ensure that all the fields are filled correctly."),
                      action: SnackBarAction(
                        label: "Close",
                        onPressed: () {},
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
