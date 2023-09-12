import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signupwithimageapp/app/app.dart';
import 'package:signupwithimageapp/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  bootstrap(() => const App());
}
