import 'package:cocktail_project/data/repositories/database_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  //register method
  Future signUp({required String email, required String password}) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        await DatabaseReposiory(user.uid).saveUserData(email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future signIn(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  bool isLoggedIn() {
    if (firebaseAuth.currentUser?.uid == null) {
      return false;
    } else {
      return true;
    }
  }
}
