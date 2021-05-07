import 'package:flutter/material.dart';
import '../components/background.dart';
import '../../MakeComplaint/makecomplaint_screen.dart';
import '../../ViewStatus/viewstatus.dart';
import '../../Signup/signup_screen.dart';
import '../../Complaint/components/background.dart';
import '../../../components/rounded_button.dart';
import '../../ProcessComplaint/processcomplaint.dart';
import '../../UpdateStatus/updatestatus_screen.dart';
import '../../../constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "COMPLAINTS",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            // SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Make Complaints",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MakeComplaintScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "View Complaint Status",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ViewStatusScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Process Complaints",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProcessComplaintScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Update Status",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UpdateStatusScreen();
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
