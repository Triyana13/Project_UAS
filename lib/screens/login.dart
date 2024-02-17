import 'package:flutter/material.dart';
import 'package:social_fed/models/api_response.dart';
import 'package:social_fed/models/user.dart';

import 'package:social_fed/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register.dart';
import '../constant.dart';
import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null){
      _saveAndRedirectToHome(response.data as User);
    }
    else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}')
      ));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text('Login'),
    centerTitle: true,
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: formkey,
      child: ListView(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.login,
              color: Colors.white,
              size: 50,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: txtEmail,
            validator: (val) =>
                val!.isEmpty ? 'Invalid email address' : null,
            decoration: kInputDecoration('Email'),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: txtPassword,
            obscureText: true,
            validator: (val) =>
                val!.length < 6 ? 'Required at least 6 chars' : null,
            decoration: kInputDecoration('Password'),
          ),
          SizedBox(height: 20),
          loading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        _loginUser();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
          SizedBox(height: 10),
          kLoginRegisterHint('Don\'t have an account? ', 'Register', () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Register()),
                (route) => false);
          })
        ],
      ),
    ),
  ),
);

  }
}