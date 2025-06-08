import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService{
  //step 1; initialise Firebase Auth and Firebase Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  //step 2; add the signInWithEmailAndPassword method
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async{
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //step 3; Register the user
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async{
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //step 4; Save the user data
  Future<void> saveUserData(User user, String username) async{
    await _firestore.collection('users').doc(user.uid).set({
      'uid': 'user.uid',
      'email': user.email,
    'username': username,
    });
  }

  //Sign Out property
Future<void> signOut() async{
    await _auth.signOut();
}

}



