import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signupwithimageapp/login/view/login_page.dart';
import 'package:signupwithimageapp/signup/repo/signuprepo.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  List<XFile> imageList = [] ;

   Future<dynamic> getImage() async{
    final imagePicker = ImagePicker();
    imageList = await imagePicker.pickMultiImage();
   }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 80, 11),
        foregroundColor: Color.fromARGB(255, 109, 209, 112),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        centerTitle: true,
        title: Text(
          'SIGN UP',
          style: TextStyle(
              color: Color.fromARGB(255, 161, 199, 183),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please fill the field';
                      },
                      decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 231, 234, 231),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(112, 8, 169, 13),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please fill the field';
                      },
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(112, 8, 169, 13),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 231, 234, 231),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: _phonenoController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please fill the field';
                      },
                      decoration: InputDecoration(
                          labelText: 'PHONE NO',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(112, 8, 169, 13),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 231, 234, 231),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please fill the field';
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(112, 8, 169, 13),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 231, 234, 231),
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getImage();
              
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/personicon.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'UPLOAD IMAGE',
                          style: TextStyle(
                              color: Color.fromRGBO(76, 175, 79, 0.87),
                              fontSize: 16),
                        ),
                      ],
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // ElevatedButton(
                    
                  //   onPressed: () async {
                  //     if (_formKey.currentState!.validate()) {
                  //       await RegisterRepo().createUser(
                  //           _nameController.text,
                  //           _emailController.text,
                  //           _phonenoController.text,
                  //           _passwordController.text,
                  //           imageList,
                  //           context);
                  //           _nameController.clear();
                  //           _emailController.clear();
                  //           _phonenoController.clear();
                  //           _passwordController.clear();
                  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('user added')));
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LoginPage(),
                  //           ));
                  //     }
                  //      else{
                  //       Center(child: CircularProgressIndicator());
                  //      }
                  //   },
                  //   child: Text(
                  //     'SIGN UP',
                  //     style: TextStyle(
                  //         color: Color.fromARGB(255, 175, 239, 211),
                  //         fontSize: 24),
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //       backgroundColor: Color.fromARGB(255, 2, 56, 4),
                  //       foregroundColor:
                  //           const Color.fromARGB(255, 90, 208, 94)),
                  // ),


TextButton(onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await RegisterRepo().createUser(
                            _nameController.text,
                            _emailController.text,
                            _phonenoController.text,
                            _passwordController.text,
                            imageList,
                            context);
                            _nameController.clear();
                            _emailController.clear();
                            _phonenoController.clear();
                            _passwordController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('user added')));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      }
                       else{
                        Center(child: CircularProgressIndicator());
                       }
                    },    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Color.fromARGB(255, 175, 239, 211),
                          fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 2, 56, 4),
                        foregroundColor:
                            const Color.fromARGB(255, 90, 208, 94)),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
