import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/firebase/firebase_auth_repositary.dart';

//this provider with firebase.instance become global and use any where.....
Provider<AuthWithFirebase> authProvider = Provider<AuthWithFirebase>((ref) {
  return AuthWithFirebase();
});

AutoDisposeStreamProvider<User?> authStateProvider =
    AutoDisposeStreamProvider<User?>((ref) {
  return ref.read(authProvider).authStateChange; //User type stream hogi yha
});

Provider<FirebaseAuth> firebaseAuthprovider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
