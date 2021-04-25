import 'package:flutter/material.dart';
import 'text_field_container.dart';
import '../constants.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key key,
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Text(label, textAlign: TextAlign.center),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
