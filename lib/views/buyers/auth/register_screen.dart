import 'dart:typed_data';

import 'package:appstore/controllers/auth_controller.dart';
import 'package:appstore/views/buyers/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/show_snackBar.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;

  late String fullName;

  late String phoneNumber;

  late String password;

  bool _isLoading = false;

  Uint8List ? _image;

  _signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      await _authController
          .signUpUsers(email, fullName, phoneNumber, password)
          .whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();
          _isLoading = false;
        });
      });

      return showSnack(
          context, 'Congratulations An Account Has Been Created For You');
    } else {
      setState(() {
        _isLoading = false;
      });
      return showSnack(context, 'Please Fields must not be empty');
    }
  }

  selectGalleryImage()async{
  Uint8List im= await _authController.pickProfileImage(ImageSource.gallery); 
  setState(() {
    _image = im;
  });
  }
  
selectCameraImage()async{
  Uint8List im= await _authController.pickProfileImage(ImageSource.camera); 
  setState(() {
    _image = im;
  });
  }

  // _signUpUser() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Customer\'s Account',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    _image!=null?CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                      backgroundImage: MemoryImage(_image!),
                    ): CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                      backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Windows_10_Default_Profile_Picture.svg/2048px-Windows_10_Default_Profile_Picture.svg.png'),
                    ),
                    Positioned(
                        right: 0,
                        top: 5,
                        child: IconButton(
                        onPressed: () {
                          selectGalleryImage();
                          selectCameraImage();
                        }, 
                        icon: const Icon(CupertinoIcons.photo,
                        //color: Colors.white,
                        ),
                        ),
                        ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Email must not be empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Enter Email',
                        hintText: 'Enter your email',
                        icon: Icon(Icons.email)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please full name must not be empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Enter Full Name',
                        hintText: 'Enter your name',
                        icon: Icon(Icons.abc)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please phone number must not be empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Enter Phone Number',
                        hintText: 'Enter your number',
                        icon: Icon(Icons.numbers)),
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
                        hintText: 'Enter your password',
                        icon: Icon(Icons.password)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _signUpUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                ),
                              )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have An Account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
