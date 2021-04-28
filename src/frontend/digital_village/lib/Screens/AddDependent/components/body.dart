import 'package:flutter/material.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

var firstName = '',
    lastName = '',
    houseNo = '',
    wardNo = '',
    street = '',
    pincode = '',
    landmark = '',
    dob = '',
    aadharNo = '0',
    contact = '0',
    profession = '',
    username = 'uname',
    ret,
    retCode;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<void> _sendData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/add_dependent');
      var response = await http.post(url, body: {
        "firstName": firstName,
        "lastName": lastName,
        "houseNo": houseNo,
        "wardNo": wardNo,
        "street": street,
        "pincode": pincode,
        "landmark": landmark,
        "dob": dob,
        "aadharNo": aadharNo,
        "contact": contact,
        "profession": profession,
        "username": username,
      });
      setState(() {
        ret = response.body;
        retCode = response.statusCode;
      });
    }

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
                hintText: "First Name",
                icon: Icons.account_circle_rounded,
                onChanged: (value) {
                  firstName = value;
                },
              ),
              RoundedInputField(
                hintText: "Last Name",
                icon: Icons.account_circle_rounded,
                onChanged: (value) {
                  lastName = value;
                },
              ),
              RoundedInputField(
                hintText: "House No.",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  houseNo = value;
                },
              ),
              RoundedInputField(
                hintText: "Ward No.",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  wardNo = value;
                },
              ),
              RoundedInputField(
                hintText: "Street",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  street = value;
                },
              ),
              RoundedInputField(
                hintText: "Pincode",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  pincode = value;
                },
              ),
              RoundedInputField(
                hintText: "Landmark",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  landmark = value;
                },
              ),
              RoundedInputField(
                hintText: "D.O.B (YYYY-MM-DD)",
                icon: Icons.calendar_today,
                onChanged: (value) {
                  dob = value;
                },
              ),
              RoundedInputField(
                hintText: "Aadhar No.",
                icon: Icons.fingerprint,
                onChanged: (value) {
                  aadharNo = value;
                },
              ),
              RoundedInputField(
                hintText: "Contact No.",
                icon: Icons.add_ic_call_rounded,
                onChanged: (value) {
                  contact = value;
                },
              ),
              RoundedInputField(
                hintText: "Profession",
                icon: Icons.home_repair_service_rounded,
                onChanged: (value) {
                  profession = value;
                },
              ),
              RoundedButton(
                text: "Add dependent",
                press: () async {
                  await _sendData();
                  if (retCode == 201) {
                    final snackBar = SnackBar(
                        content: Text("Added Dependent"),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (ret == null) {
                    ;
                  } else {
                    final snackBar = SnackBar(
                        content: Text(ret),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
