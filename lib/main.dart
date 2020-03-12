import 'package:flutter/material.dart';
import 'package:login_ui/screen/toggle_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(187, 181, 242, 1.0),
        accentColor: Color.fromRGBO(252, 243, 243, 1.0),
      ),
      home: ToggleForms(),
    );
  }
}
