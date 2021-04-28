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
        child: Row(children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        padding: EdgeInsets.all(1),
        child: Row(children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                NiceButton(
                  mini: true,
                  icon: Icons.update_rounded,
                  radius: 40,
                  gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdateDetailScreen();
                        },
                      ),
                    );
                  },
                ),
                Text('Update Contacts\n',
                    style: TextStyle(color: Colors.white)),
                NiceButton(
                  mini: true,
                  icon: Icons.upload_rounded,
                  radius: 40,
                  gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UploadFormsScreen();
                        },
                      ),
                    );
                  },
                ),
                Text('Upload Forms\n', style: TextStyle(color: Colors.white)),
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
                Text('Reset Password\n', style: TextStyle(color: Colors.white)),
                NiceButton(
                  mini: true,
                  icon: Icons.announcement_rounded,
                  radius: 40,
                  gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddAnnouncementsScreen();
                        },
                      ),
                    );
                  },
                ),
                Text('Add Announcements\n',
                    style: TextStyle(color: Colors.white)),
                NiceButton(
                  mini: true,
                  icon: Icons.bar_chart,
                  radius: 40,
                  gradientColors: [Color(0xfffc4a0f), Color(0xfffc9d0f)],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AnalyticsScreen();
                        },
                      ),
                    );
                  },
                ),
                Text('Analytics\n', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ]),
      ),
    ]));
  }
}
