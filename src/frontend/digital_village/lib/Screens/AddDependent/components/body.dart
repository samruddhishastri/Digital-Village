import 'package:flutter/material.dart';
import '../../Dashboard/dashboard.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';

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
                "Add Dependent",
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
              RoundedButton(
                text: "Add",
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
              //
            ],
          ),
        ),
      ),
    );
  }
}
