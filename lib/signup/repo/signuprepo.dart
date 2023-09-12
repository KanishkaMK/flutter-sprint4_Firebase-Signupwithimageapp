// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SignupRepo {
//   Future<void> createUser(String name, String email, String phone,
//       String passwd, List<XFile> images, BuildContext context) async {
//     final _auth = FirebaseAuth.instance;
//     List<String> image = [];
//     final CollectionReference userRef =
//         FirebaseFirestore.instance.collection('usercollection');
//     try {
//       final usreCredantial = await _auth.createUserWithEmailAndPassword(
//           email: email, password: passwd);

//       for (final element in images) {
//         final ref =
//             FirebaseStorage.instance.ref().child('image').child(element.name);
//         final file = File(element.path);
//         await ref.putFile(file);
//         final imageUrl = await ref.getDownloadURL();
//         image.add(imageUrl);
//       }

//       await userRef.doc(usreCredantial.user!.uid).set({
//         'userid': _auth.currentUser!.uid,
//         'name': name,
//         'email': email,
//         'phone': phone,
//         'password': passwd,
//         'image': image
//       });
//     } 
    
//     on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.message as String)));
//     }}
    
// }
    
    
// //     on FirebaseAuthException catch (e) {
// //   if (e.code == 'email-already-in-use') {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(
// //         content: Text('The email address is already registered.'),
// //       ),
// //     );
// //   } else {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text('An error occurred: ${e.message}'),
// //       ),
// //     );
// //   }
// //   }
// // }}




// test 1 with out image


// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SignupRepo {
//   Future<void> createUser(String name, String email, String phone,
//       String passwd,  BuildContext context) async {
//     final _auth = FirebaseAuth.instance;
//     // List<String> image = [];
//     final CollectionReference userRef =
//         FirebaseFirestore.instance.collection('usercollection');
//     try {
//       final usreCredantial = await _auth.createUserWithEmailAndPassword(
//           email: email, password: passwd);

//       // for (final element in images) {
//       //   final ref =
//       //       FirebaseStorage.instance.ref().child('image').child(element.name);
//       //   final file = File(element.path);
//       //   await ref.putFile(file);
//       //   final imageUrl = await ref.getDownloadURL();
//       //   image.add(imageUrl);
//       // }

//       await userRef.doc(usreCredantial.user!.uid).set({
//         'userid': _auth.currentUser!.uid,
//         'name': name,
//         'email': email,
//         'phone': phone,
//         'password': passwd,
        
//       });
//     } 
    
//     on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.message as String)));
//     }}
    
// }




// test 2 



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class RegisterRepo {

  Future<void> createUser(String name, String email, String phone, String pwd ,List<XFile> images, BuildContext context ) async {
    
    List<String> userImages = [];
    final _auth = FirebaseAuth.instance;
    final CollectionReference imageTaskRef = FirebaseFirestore.instance.collection('usercollection');
    try {

      final usreCredantial = await _auth.createUserWithEmailAndPassword(
         email: email, password: pwd,);
  
  for(final element in images){
    final ref = FirebaseStorage.instance.ref().child('taskimages').child(element.name);
    final file = File(element.path);
    await ref.putFile(file);
    final imageUrl = await ref.getDownloadURL();
    userImages.add(imageUrl);

  }
      await imageTaskRef.doc(usreCredantial.user!.uid).set(
        {
          'userid': _auth.currentUser!.uid,
        'name': name,
        'email': email,
        'phone': phone,
        'password': pwd,
        'image': userImages
          
        }
      );
    }on FirebaseAuthException catch (e) {
      throw Exception('failed');
      
    }          

  }

}

//flutter pub add uuid ->comment for add id for task(for making id small)
//flutter upgrade maily uses when errors come
//flutter pub add image _picker to add image