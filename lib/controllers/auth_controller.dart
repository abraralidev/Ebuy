// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, await_only_futures, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {

var isloading = false.obs;

  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();
  // Future<UserCredential?> loginMethod(context) async {
  //   UserCredential? _userCredential;
  //   try {
  //     await auth.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //   } on FirebaseAuthException catch (e) {
  //     VxToast.show(context, msg: e.toString());
  //   }
  //   return _userCredential;
  // }
  

//--------------------------------------SignUp------------------------------------------
  Future<UserCredential?> signUpMethod(email, password, context) async {
    UserCredential? _userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return _userCredential;
  }

//--------------------------------------Storing Data------------------------------------------
  storeUserData(name, password, email) async {
    DocumentReference _store =
        await firestore.collection(usersCollection).doc(currentUser!.uid);
    _store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'wishlist_count': '00',
      'cart_count': '00',
      "order_count": '00',

    });
  }

//--------------------------------------SignOut------------------------------------------
  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
