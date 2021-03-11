import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import '../../../Screens/Dashboard/components/background.dart';
import '../../AboutUs/aboutus_screen.dart';
import '../../ContactUs/contactus_screen.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        padding: EdgeInsets.all(1),
        child: Row(children: <Widget>[
          //icon with label below it
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.people_alt_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                Text('Add Dependents\n', style: TextStyle(color: Colors.white)),
                Icon(
                  Icons.face,
                  size: 40,
                  color: Colors.white,
                ),
                Text('Complaints\n', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.file_copy_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                Text('Organisation chart\n',
                    style: TextStyle(color: Colors.white)),
                Icon(
                  Icons.download_rounded,
                  size: 40,
                  color: Colors.white,
                ),
                Text('Download forms\n', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.credit_card,
                  size: 40,
                  color: Colors.white,
                ),
                Text('Payments\n', style: TextStyle(color: Colors.white)),
                // Text('About us\n', style: TextStyle(color: Colors.white)),
                NiceButton(
                  mini: true,
                  icon: Icons.info,
                  radius: 40,
                  gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AboutUsScreen();
                        },
                      ),
                    );
                  },
                ),
                Text('About Us\n', style: TextStyle(color: Colors.white)),

                NiceButton(
                  mini: true,
                  icon: Icons.email,
                  radius: 40,
                  gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ContactUsScreen();
                        },
                      ),
                    );
                  },
                ),
                Text('Contact Us\n', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ]),
      ),
      // Positioned(
      //   top: size.longestSide - 100,
      //   right: size.width - 200,
      //   child: Container(
      //     // padding: EdgeInsets.all(15),
      //     child: Column(
      //       children: <Widget>[
      //         Text('Add Dependents\n',style: TextStyle(color: Colors.white) ),
      //         Icon(
      //           Icons.face,
      //           size: 40,
      //           color: Colors.white,
      //         ),
      //         Text('Complaints\n',style: TextStyle(color: Colors.white)),
      //       ],
      //     ),
      //   )),
    ]));
  }
}
