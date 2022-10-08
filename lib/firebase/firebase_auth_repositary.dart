import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_understanding/Views/molecule/flutter_toast.dart';
import 'package:riverpod_understanding/Views/screens/home_page.dart';

class AuthWithFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange {
    return _auth.authStateChanges();
  }

  Future<User?> signIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return HomeScreen();
        }));
        return result.user;
      } else {}
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowToast().showToast('No User Found!');
      } else if (e.code == 'wrong-password') {
        ShowToast().showToast('Wrong password!');
      } else {
        ShowToast().showToast('something went wrong');
      }
    }
  }

  Future<User?> signUp(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      ShowToast().showToast(e.code.toString());
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      ShowToast().showToast('Signed out sucessfull');
    } on FirebaseAuthException catch (e) {
      ShowToast().showToast('cannot signed out! error: $e');
    }
  }
}

class AuthExecption implements Exception {
  final String message;

  AuthExecption(this.message);

  @override
  String toString() {
    return message;
  }
}
