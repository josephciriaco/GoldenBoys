import 'package:firebase_auth/firebase_auth.dart';
import 'package:goldenboys/user/repository/firebase_auth_api.dart';

class AuthRepository{

  final _firebaseAuthAPI = FireBaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

}