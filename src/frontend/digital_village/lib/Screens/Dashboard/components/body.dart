import 'package:flutter/material.dart';
import '../../../Screens/Dashboard/components/background.dart';
import '../../Signup/signup_screen.dart';
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
      child: Container(
        margin: EdgeInsets.fromLTRB(0,20,0,0),
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
              Text('Add Dependents\n'),
              Icon(
                Icons.face,
                size: 40,
                color: Colors.white,
              ),
              Text('Complaints\n'),
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
              Text('Organisation chart\n'),
            
              Icon(
                Icons.download_rounded,
                size: 40,
                color: Colors.white,
              ),
              Text('Download forms\n'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.credit_card,
                size: 40,
                color: Colors.white,
              ),
              Text('Payments\n'),
              Icon(
                Icons.info,
                size: 40,
                color: Colors.white,
              ),
              Text('About us\n'),
            ],
          ),
        )
      ]),
    ));
  }
}
