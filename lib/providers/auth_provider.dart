// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthProvider with ChangeNotifier {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   User? _user;

//   User? get user => _user;

//   Future<void> signIn(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
//       _user = userCredential.user;
//       notifyListeners();
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<void> register(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       _user = userCredential.user;
//       notifyListeners();
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//     _user = null;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:online_voting_system/providers/auth_provider.dart';
// import 'package:firebase_auth_platform_interface/src/auth_provider.dart';
// import 'package:online_voting_system/providers/auth_provider.dart';


class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
