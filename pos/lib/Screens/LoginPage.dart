import 'package:flutter/material.dart';
import 'package:pos/Screens/DashboardPage.dart';

class LoginPages extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPages> {
  final _formKey = GlobalKey<FormState>();

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
                onSaved: (value) => _password = value!,
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPages()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
