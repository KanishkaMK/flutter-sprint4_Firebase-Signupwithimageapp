import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signupwithimageapp/signup/repo/signuprepo.dart';
import 'package:signupwithimageapp/widgets/card_widget.dart';

class HomePage extends StatelessWidget {
 
 HomePage({super.key, required this.userEmail, required this.userName});
   final String? userEmail;
   final String? userName;

   final _auth = FirebaseAuth.instance;
  final _userRef = FirebaseFirestore.instance.collection('usercollection'); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 80, 11),
        foregroundColor: Color.fromARGB(255, 109, 209, 112),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        centerTitle: true,
        title: Text(
          'PROFILE',
          style: TextStyle(
              color: Color.fromARGB(255, 161, 199, 183),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //     //  Text(userName as String),
      //       Text(userEmail as String),
      //     ],
      //   ),
      // ),

       body: StreamBuilder(
        stream: _userRef.where('userid',isEqualTo: _auth.currentUser!.uid).snapshots(),

        builder: (context, snapshot) {
          if(snapshot.hasData){
          
          final task = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 0.7
              ), 
          itemCount: task.length,    
            itemBuilder: (BuildContext context, int index) {
                return CradWidget(userRef: task[index]);
            },);

 
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
          
        },
      ),



    );
  }
}
