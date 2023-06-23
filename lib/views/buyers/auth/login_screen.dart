import 'package:appstore/utils/show_snackBar.dart';
import 'package:appstore/views/buyers/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;

  late String password;

  bool _isLoading = false;

  _loginUsers() async {
    // setState(() {
    //   _isLoading = true;
    // });
    if (_formKey.currentState!.validate()) {
      String res = await _authController.loginUsers(email, password);
      if (res == 'success') {
        return  Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return  MainScreen();
          }),);
      }else{
        return showSnack(context, res);
      }
    } else {
      // setState(() {
      //   _isLoading = false;
      // });
      return showSnack(context, 'Please feilds most not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login Customer\'s Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(13),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Email field most not be empty';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Email Address',
                    hintText: 'Enter you email',
                    icon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please password must not be empty';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Password',
                    hintText: 'Enter password',
                    icon: Icon(Icons.password),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _loginUsers();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need An Account?'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
