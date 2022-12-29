import 'package:ebuy/consts/consts.dart';

class FireStoreServices {
  static getUser(String uid) {
    return firestore.collection(usersCollection).where('id',isEqualTo: currentUser!.uid ).snapshots();
  }
}
