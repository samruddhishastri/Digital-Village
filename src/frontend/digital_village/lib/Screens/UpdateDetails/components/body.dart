import 'package:flutter/material.dart';
import '../components/background.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/checkbox_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

bool _isSelected = false;
var username = '',
    houseno = '',
    wardno = '',
    street = '',
    pincode = '',
    landmark = 'Landmark',
    contactno = '',
    profession = '',
    ret,
    retCode;

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _sendData() async {
      var url = Uri.parse('http://127.0.0.1:8000/api/update_details');
      var response = await http.post(url, body: {
        "username": username,
        "houseNo": houseno,
        "wardNo": wardno,
        "street": street,
        "pincode": pincode,
        "mobileno": contactno,
        "profession": profession,
        "add_admin": _isSelected.toString(),
        "landmark": landmark,
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
                "Update Details",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Username of user whose details you want to edit",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  username = value;
                },
              ),

              RoundedInputField(
                hintText: "House No.",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  houseno = value;
                },
              ),
              RoundedInputField(
                hintText: "Ward No.",
                icon: Icons.house_rounded,
                onChanged: (value) {
                  wardno = value;
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
                hintText: "Contact No.",
                icon: Icons.add_ic_call_rounded,
                onChanged: (value) {
                  contactno = value;
                },
              ),
              RoundedInputField(
                hintText: "Profession",
                icon: Icons.home_repair_service_rounded,
                onChanged: (value) {
                  profession = value;
                },
              ),
              CheckBoxField(
                child: Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      _isSelected = value;
                    });
                  },
                  value: _isSelected,
                  activeColor: Color(0xFF6200EE),
                ),
              ),
              RoundedButton(
                text: "Update Details",
                press: () async {
                  await _sendData();
                  if (retCode == 201) {
                    final snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("Details have been updated!"),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (ret == null) {
                    ;
                  } else {
                    final snackBar = SnackBar(
                        content: Text(
                            "Updating details failed! Please ensure that all the fields are correctly filled."),
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {},
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
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
