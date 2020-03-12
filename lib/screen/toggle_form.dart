import 'package:flutter/material.dart';
import 'package:login_ui/screen/login_ui.dart';
import 'package:login_ui/screen/sign_up_ui.dart';

class ToggleForms extends StatefulWidget {
  @override
  _ToggleFormsState createState() => _ToggleFormsState();
}

class _ToggleFormsState extends State<ToggleForms> {

  bool showLogin = true;

  void toggleView(){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLogin) {
      return LogIn(toggleView: toggleView);
    }
    else {
      return SignUp(toggleView: toggleView);
    }
  }
}

