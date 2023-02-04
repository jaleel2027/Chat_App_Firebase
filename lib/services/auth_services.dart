import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthServices{

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Login code::
  Future<void> SignInWithGoogle( BuildContext context ) async{

   try{
     //try to signIn:
     GoogleSignInAccount? googleSignInAccount  = await googleSignIn.signIn();
     if(googleSignInAccount!=null){
       //authentication:
       GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
       //fetch creadentials:
       AuthCredential credential = GoogleAuthProvider.credential(
         idToken: googleSignInAuthentication.idToken,
         accessToken: googleSignInAuthentication.accessToken,
       );
       //signin in firebase:
       try{
         UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
         
         //back to welcome Screen:
         Navigator.pushNamedAndRemoveUntil(context, 'Welcome', (route) => false);

       }catch(e){
         //show snackbar:
         final snackBar = SnackBar(content: Text('Could not sign due to: ($e)',
         style: TextStyle(
           color: Colors.red,
           backgroundColor: Colors.black,
         ),));
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
       }
     }else{
       //show snackbar:
       final snackBar = SnackBar(content: Text('Could not sign ',
         style: TextStyle(
           color: Colors.red,
           backgroundColor: Colors.black,
         ),));
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     }

   }catch(e){
     //show snackbar:
     final snackBar = SnackBar(content: Text('Could not sign due to: ($e)',
       style: TextStyle(
         color: Colors.red,
         backgroundColor: Colors.black,
       ),));
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
   }

  }

  //Logout code::
  Future<void> signOutOfGoogle(BuildContext context) async{

    try{
      googleSignIn.signOut();
      firebaseAuth.signOut();

      //back to Login Screen:
      Navigator.pushNamedAndRemoveUntil(context, 'Login', (route) => false);

    }catch (e){
      //show snackbar:
      final snackBar = SnackBar(content: Text('Could not logout due to: ($e)',
        style: TextStyle(
          color: Colors.red,
          backgroundColor: Colors.black,
        ),));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }



}