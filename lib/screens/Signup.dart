import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynk/screens/Home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _email;
  String _password;
  String _name;
  String _number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black12),
        title: Text(
          "Signup",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24),
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
        children: <Widget>[
          _showNameInput(),
          _showEmailInput(),
          _showPasswordInput(),
          _showPhoneNumberInput()
        ],
      );

  Widget _showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'Name'),
        autofocus: true,
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (value) => _name = value,
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
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

  Widget _showPhoneNumberInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(hintText: 'Phone number'),
        autofocus: false,
        validator: (value) =>
            value.isEmpty ? 'Phone number can\'t be empty' : null,
        onSaved: (value) => _number = value,
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
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
        padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
        child: MaterialButton(
          elevation: 5.0,
          minWidth: 240.0,
          height: 50.0,
          color: Color(0xff0d00ff),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text('Signup',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget _showSecondaryButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
        child: FlatButton(
          child: Text('Existing user?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
          onPressed: _moveToLogin,
        ));
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  void _validateAndSubmit() async {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      String userId;

      print('Printing the login data.');
      print('Email: $_email');
      print('Password: $_password');
      userId = await signUp(_email, _password);
      print('userId : $userId');
      if (userId != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(userId: userId)));
      }
    }
  }

  void _moveToLogin() {
    Navigator.pop(context);
  }
}
