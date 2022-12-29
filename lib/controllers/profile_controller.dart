// ignore_for_file: unused_local_variable, deprecated_member_use, depend_on_referenced_packages

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebuy/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  var profileimageurl = ''.obs;
  var isloading = false.obs;
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .getImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

// upload image to firebase storage
  uploadImage() async {
    var filename = basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    var ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    var profileimageurl = await ref.getDownloadURL();
  }

//update user data
  updateProfile(name, password, imgurl) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
   await store.set({
      'name': name,
      'password': password,
      'imageurl': imgurl,
    }, SetOptions(merge: true));
    isloading(false);
  }

  // textfeild controllers
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
}
