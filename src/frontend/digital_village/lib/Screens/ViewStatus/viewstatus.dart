import 'package:flutter/material.dart';
import './components/body.dart';

class ViewStatusScreen extends StatelessWidget {
  final id;

  // In the constructor, require a Todo.
  ViewStatusScreen({Key key, @required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id: id),
    );
  }
}
