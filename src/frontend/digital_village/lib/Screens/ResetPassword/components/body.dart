import 'package:flutter/material.dart';
import '../../../Screens/Login/components/background.dart';

import '../../Dashboard/dashboard.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            RoundedPasswordField(
              text: "Password",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              text: "Confirm Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Reset Password",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Dashboard();
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
