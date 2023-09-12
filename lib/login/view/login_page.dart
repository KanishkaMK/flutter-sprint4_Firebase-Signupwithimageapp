import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signupwithimageapp/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please fill the field';
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) return 'Please fill the field';
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
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
                    onPressed: () async {
                      try {
                        final _auth = FirebaseAuth.instance;
                        final userRef = await _auth.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);

                            String? userName = _auth.currentUser?.displayName;
                            String? userEmail = _auth.currentUser?.email;

                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(userName.toString())));
                           

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage( userEmail: userEmail,userName: userName),
                            ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid Credentials')));
                      }
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                          color: Color.fromARGB(255, 175, 239, 211),
                          fontSize: 24),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 2, 56, 4),
                        foregroundColor:
                            const Color.fromARGB(255, 90, 208, 94)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
