import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseReposiory {
  final String? uid;

  DatabaseReposiory(this.uid);
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference favCollection =
      FirebaseFirestore.instance.collection("favorites");
  Future saveUserData(String email) async {
    return await userCollection.doc(uid).set({
      "email": email,
      "uid": uid,
      "favorites": [],
    });
  }

  Future getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  String getId2(String s) {
    List<String> ar = s.split('_');
    return ar[1];
  }

  String getId1(String s) {
    List<String> ar = s.split('_');
    return ar[0];
  }

  Future<void> addOrRemoveFromFavorite(
      {required String imageUrl,
      required String title,
      required String id}) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot snapshot = await userDocumentReference.get();
    List<dynamic> drinks = snapshot["favorites"];
    if (drinks.contains('${imageUrl}_${title}_$id')) {
      await userDocumentReference.update({
        "favorites": FieldValue.arrayRemove(['${imageUrl}_${title}_$id']),
      });
    } else {
      await userDocumentReference.update({
        "favorites": FieldValue.arrayUnion(['${imageUrl}_${title}_$id']),
      });
    }
  }

  Future<bool> isFavorited(
      {required String imageUrl,
      required String title,
      required String id}) async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot snapshot = await userDocumentReference.get();
    List<dynamic> drinks = snapshot["favorites"];
    if (drinks.contains('${imageUrl}_${title}_$id')) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> getUserFavorite() async {
    DocumentReference userDocumentReference = userCollection.doc(uid);
    DocumentSnapshot snapshot = await userDocumentReference.get();
    return snapshot["favorites"];
  }
}
