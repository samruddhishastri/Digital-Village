import 'package:flutter/material.dart';
import 'package:temp/Screens/Dashboard/dashboard.dart';
import '../../Dashboard/dashboard.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_password_field.dart';
import '../../../constants.dart';
import '../../../Screens/Signup/components/qrcode.dart';
import '../../../components/floating_action_buttoncus.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                "Update Details",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "House No.",
                icon: Icons.house_rounded,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Ward No.",
                icon: Icons.house_rounded,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Street",
                icon: Icons.house_rounded,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Pincode",
                icon: Icons.house_rounded,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Landmark",
                icon: Icons.house_rounded,
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
                text: "Update Details",
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
              // SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
