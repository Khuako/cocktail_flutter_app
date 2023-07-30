import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseReposiory{
  final String? uid;

  DatabaseReposiory(this.uid);
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  Future saveUserData(String email) async {
    return await userCollection.doc(uid).set({
      "email" : email,
      "uid" : uid,
      "favorites":[],
    });
  }
}