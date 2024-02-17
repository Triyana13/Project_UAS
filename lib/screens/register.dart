import 'package:social_fed/models/api_response.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_fed/models/user.dart';
import 'package:social_fed/screens/home.dart';
import 'package:social_fed/service/user_service.dart';

import '../constant.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController
    nameController = TextEditingController(), 
    emailController = TextEditingController(),
    passwordController = TextEditingController(),
    passwordConfirmController = TextEditingController();

  void _registerUser () async {
    ApiResponse response = await register(nameController.text, emailController.text, passwordController.text);
    if(response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } 
    else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}')
      ));
    }
  }

  // Save and redirect to home
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
    title: Text('Register'),
    centerTitle: true,
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: formKey,
      child: ListView(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.app_registration_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: nameController,
            validator: (val) => val!.isEmpty ? 'Invalid name' : null,
            decoration: kInputDecoration('Name'),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
            decoration: kInputDecoration('Email'),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (val) =>
                val!.length < 6 ? 'Required at least 6 chars' : null,
            decoration: kInputDecoration('Password'),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordConfirmController,
            obscureText: true,
            validator: (val) =>
                val != passwordController.text
                    ? 'Confirm password does not match'
                    : null,
            decoration: kInputDecoration('Confirm password'),
          ),
          SizedBox(height: 20),
          loading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        loading = !loading;
                        _registerUser();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
          SizedBox(height: 20),
          kLoginRegisterHint('Already have an account? ', 'Login', () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false);
          })
        ],
      ),
    ),
  ),
);

  }
}