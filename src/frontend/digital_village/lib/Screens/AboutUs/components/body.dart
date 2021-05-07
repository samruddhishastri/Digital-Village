import 'package:flutter/material.dart';
import '../components/background.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';
import '../../../components/rounded_button.dart';
import '../../../constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  final String description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas et pellentesque dui, sed efficitur magna. Nulla a gravida mauris, et eleifend turpis. Nam scelerisque at risus vitae rutrum. Donec est erat, pharetra a lorem id, mattis consequat lorem. Fusce rutrum nunc ac erat semper ultrices. Cras rhoncus ipsum at tincidunt egestas. Cras massa sem, bibendum varius ligula ac, mollis ornare neque. Aliquam accumsan ex venenatis nulla viverra efficitur. Fusce hendrerit nisl arcu, a dictum mi placerat vel. Duis elementum euismod tincidunt. Etiam facilisis ullamcorper justo, ut imperdiet ligula fermentum varius. Integer quam est, rutrum ut nulla a, condimentum aliquam augue.Maecenas ac nisi sagittis, convallis felis sit amet, lacinia orci. Proin quis ultricies nibh. Integer pharetra urna vel neque convallis imperdiet. Aenean ac erat est. Proin sit amet augue elit. Pellentesque eget purus vel est vehicula ullamcorper id sed purus. Donec ut venenatis nisi.Phasellus iaculis orci vitae ligula pretium fermentum. Morbi gravida aliquet quam. In semper tincidunt fermentum. Nullam sit amet enim turpis. Proin placerat, nisl eget scelerisque rutrum, nisi ante accumsan nunc, nec pharetra tortor leo a erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non lacus vel dui rhoncus posuere auctor non massa. Morbi hendrerit porttitor sagittis. In dignissim lacus nibh. Aenean nec metus sit amet nisl vestibulum vehicula non vitae ligula. Aenean et erat dui. Pellentesque sollicitudin, neque vitae facilisis rhoncus, augue tortor bibendum orci, a porta diam odio a quam. In ac tellus vel libero interdum pulvinar. Quisque aliquam neque in dignissim aliquet. Nulla aliquet fringilla massa et dictum.In quis dui at dolor dictum viverra. Praesent laoreet mi ligula. Aliquam vitae arcu scelerisque, lobortis leo vitae, congue eros. Curabitur tortor nulla, sodales interdum efficitur non, aliquet ac mi. Nulla accumsan elementum massa, sed rutrum leo scelerisque et. Duis justo libero, semper ac nisl et, fringilla egestas ipsum. Nulla feugiat mollis mauris, eu gravida leo sollicitudin a. Vivamus enim augue, vehicula eget metus nec, vehicula scelerisque felis. Phasellus eros turpis, finibus id luctus vitae, ultrices consequat ex. Sed et nisi quis ante dictum aliquam id a justo. Proin vitae scelerisque felis. Donec blandit rhoncus nisi, vel fermentum ex vulputate ut. Donec faucibus, elit ut tristique rutrum, erat est ullamcorper lorem, a maximus risus nisi id urna. Nullam eget mauris tristique, sollicitudin eros blandit, consectetur risus.Ut pellentesque sed ligula ac scelerisque. Etiam sit amet risus in lacus interdum dictum vel id nibh. Nullam ac arcu sit amet nisl gravida vehicula. Aliquam erat volutpat. Nullam hendrerit interdum nisl, quis molestie nunc venenatis pharetra. Curabitur a nisl ipsum. Nullam vulputate fringilla odio, vitae pellentesque nulla sodales ac. Ut ante lacus, maximus et arcu et, tincidunt consectetur sapien. Sed velit diam, fringilla at ante nec, posuere viverra orci.";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("About Us"),
      ),
      body: new Container(
        child: new DescriptionTextWidget(text: description),
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: new TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
