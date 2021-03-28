import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

<<<<<<< HEAD
// <<<<<<< HEAD
=======

>>>>>>> e262a7f397a7632173f7dfa27e2472a03a969289
import 'package:temp/main.dart';
// =======
// >>>>>>> d7c142d8dc64abdcf3257113d8058495fcd93ca6
// import 'package:temp/main.dart';



void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
