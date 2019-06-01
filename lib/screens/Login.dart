import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

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
          "Login",
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
      padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
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
      padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 0.0),
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
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
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

  void _validateAndSubmit() {}

  void _moveToSignup() {}
}
