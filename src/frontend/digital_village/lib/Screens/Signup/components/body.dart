import 'package:flutter/material.dart';
import '../../Login/login_screen.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_password_field.dart';
import '../../../constants.dart';
import '../../../components/floating_action_buttoncus.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Register",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            // SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Name",
              icon: Icons.account_circle_rounded,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Address",
              icon: Icons.house_rounded,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "D.O.B",
              icon: Icons.calendar_today,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Aadhar No.",
              icon: Icons.fingerprint,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Contact No.",
              icon: Icons.add_ic_call_rounded,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Profession",
              icon: Icons.home_repair_service_rounded,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Username",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Register",
              press: () {},
            ),
            // SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
              //
          ],
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton: FloatingActionButton(
              // onPressed: Null,// On press per qrcode code wala karna
              child: Icon(Icons.qr_code),
              backgroundColor: kPrimaryColor,
              // onPressed: ,
            ),
            );
  }
}
