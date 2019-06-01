import 'package:flutter/material.dart';
import 'package:lynk/screens/Signup.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynk/screens/Home.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "lynk",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 32),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _inputs(),
            _showPrimaryButton(),
            _showSecondaryButton()
          ],
        ),
      ),
    );
  }

  Widget _inputs() => Column(
        children: <Widget>[_showEmailInput(), _showPasswordInput()],
      );

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 10.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(hintText: 'Email'),
        autofocus: false,
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(hintText: 'Password'),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(60.0, 40.0, 60.0, 0.0),
        child: MaterialButton(
          elevation: 5.0,
          minWidth: 240.0,
          height: 50.0,
          color: Color(0xff0d00ff),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text('Login',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget _showSecondaryButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: FlatButton(
          child: Text('Create an account',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
          onPressed: _moveToSignup,
        ));
  }

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  void _validateAndSubmit() async {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: $_email');
      print('Password: $_password');
      String userId = await signIn(_email, _password);
      print('userId : $userId');
      if(userId != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(userId: userId)));
      }
    }
  }

  void _moveToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup()),
    );
  }
}
