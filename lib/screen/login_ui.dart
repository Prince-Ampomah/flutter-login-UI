import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogIn extends StatefulWidget {

  Function toggleView;
  LogIn({this.toggleView});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final String login = 'Log In';
  String email = '';
  String password = '';
  bool _isHidden = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(){
   final snackBar = SnackBar(
     elevation: 10.0,
     content: Text('Logged In',
     style: TextStyle(
       color: Colors.black87,
     ),
     ),
     backgroundColor: Theme.of(context).accentColor,
     duration: Duration(seconds: 2),
    );
   _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 35.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(20)),
                      color: Theme.of(context).accentColor,
                      boxShadow: [BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(12, 12),
                      )]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(login,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              onChanged: (value){
                                setState(() => email = value );
                              },
                              validator: (value) => email.isEmpty? 'Email required': null,
                              cursorColor: Theme.of(context).primaryColor,
                              keyboardType: TextInputType.emailAddress ,
                              autocorrect: true,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            TextFormField(
                              onChanged: (value){
                                setState(() => password = value );
                              },
                              validator: (value) => password.isEmpty? 'Password required' : null,
                              obscureText: _isHidden? true : false,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  onPressed: toggleVisibility,
                                  icon: _isHidden? Icon(Icons.visibility_off,
                                    color: Colors.blueGrey[200],
                                    size: 18.0,) : Icon(Icons.visibility,
                                    color: Colors.blueGrey[200],
                                    size: 18.0,),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: (){},
                                    child: Text('Forget Password?',
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.77,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.blueGrey,
                                  offset: Offset(5, 5),
                                )],
                              ),
                              child: FlatButton(
                                onPressed: (){
                                  if(_formKey.currentState.validate()){
                                    _showSnackBar();
                                  }
                                },
                                child: Text('LOG IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Not registered yet?'),
                                FlatButton(
                                  onPressed: (){
                                    widget.toggleView();
                                  },
                                  child: Text('Sign Up',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    print('Facebook Login');
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/icons/facebook.png'),
                                    backgroundColor: Theme.of(context).accentColor,
                                    radius: 10.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                InkWell(
                                  onTap: (){
                                    print('Google Login');
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/icons/google.png'),
                                    backgroundColor: Theme.of(context).accentColor,
                                    radius: 10.0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
