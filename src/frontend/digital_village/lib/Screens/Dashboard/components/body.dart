import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import '../../../Screens/Dashboard/components/background.dart';
import '../../AboutUs/aboutus_screen.dart';
import '../../ContactUs/contactus_screen.dart';
import '../../UpdateDetails/update_screen.dart';
import '../../UploadForms/upload_forms.dart';
import '../../DownloadForms/download_forms.dart';
import '../../ResetPassword/reset_password.dart';
import '../../Complaint/complaint_screen.dart';
import '../../AddAnnouncements/addannouncements_scree.dart';
import '../../AddDependent/add_dependent.dart';
import '../../ViewAnnouncements/view_announcements.dart';
import '../../Analytics/analytics_screen.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 1000.0,
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Column(children: <Widget>[
                  NiceButton(
                    mini: true,
                    icon: Icons.people_alt_outlined,
                    radius: 40,
                    gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddDependentScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Text('Add Dependents\n',
                      style: TextStyle(color: Colors.white)),
                  NiceButton(
                    mini: true,
                    icon: Icons.face,
                    radius: 40,
                    gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ComplaintScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Text('Complaints\n', style: TextStyle(color: Colors.white)),
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
                  NiceButton(
                    mini: true,
                    icon: Icons.download_rounded,
                    radius: 40,
                    gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DownloadFormsScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Text('Download Forms\n',
                      style: TextStyle(color: Colors.white)),
                  NiceButton(
                    mini: true,
                    icon: Icons.download_rounded,
                    radius: 40,
                    gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewAnnoucementScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Text('View Announcements\n',
                      style: TextStyle(color: Colors.white)),
                  NiceButton(
                    mini: true,
                    icon: Icons.refresh_rounded,
                    radius: 40,
                    gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResetPasswordScreen();
                          },
                        ),
                      );
                    },
                  ),
                  Text('Reset Password\n',
                      style: TextStyle(color: Colors.white)),
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
            ])));
  }
}
