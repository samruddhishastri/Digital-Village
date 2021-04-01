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
                "Upload Forms",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Title",
                icon: Icons.title_rounded,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Description",
                icon: Icons.wysiwyg_outlined,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Link.",
                icon: Icons.link_rounded,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "Upload Form",
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
