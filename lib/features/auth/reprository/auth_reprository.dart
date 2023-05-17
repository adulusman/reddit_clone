import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit_clone/core/provider/firebase_provider.dart';

final authRprositoryProvider = Provider((ref) => AuthReprository(
    firestore: ref.read(firestoreProvider),
    firebaseAuth: ref.read(firebaseAuthProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthReprository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthReprository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth,
      required GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      print(userCredential.user?.email);
    } catch (e) {
      print(e);
    }
  }
}
