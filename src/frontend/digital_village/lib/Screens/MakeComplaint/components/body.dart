import 'package:flutter/material.dart';
import '../../Dashboard/dashboard.dart';
import '../components/background.dart';
import 'package:temp/components/rounded_dropdown_field.dart';
import 'package:temp/components/rounded_dropdown_category.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';

class Body extends StatelessWidget {
  String dropdownValue = "Category";
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
                "Citizen Complaint Entry",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Title",
                icon: Icons.title,
                onChanged: (value) {},
              ),
              // new DropdownButton<String>(
              //   // value: "Category",
              //   hint: Text("Category"),
              //   icon: Icon(Icons.list),
              //   items: <String>['Adfghjk', 'B', 'Cghjk', 'D.........']
              //       .map((String value) {
              //     return new DropdownMenuItem<String>(
              //       value: value,
              //       child: new Text(value),
              //     );
              //   }).toList(),
              //   onChanged: (_) {},
              // ),
              DropDownCategory(),
              RoundedInputField(
                hintText: "Complaint Description",
                icon: Icons.description,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Add Link",
                icon: Icons.link_rounded,
                onChanged: (value) {},
              ),
              DropDownField(),
              RoundedButton(
                text: "Submit",
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
              // SizedBox(height: size.height * 0.03)
              //
            ],
          ),
        ),
      ),
    );
  }
}
