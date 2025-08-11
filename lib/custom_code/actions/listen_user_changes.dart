// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/flutter_flow/nav/nav.dart';
import '/auth/firebase_auth/firebase_user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

int _CurrentListeningUser = 0;

Future listenUserChanges() async {
  FFAppState().addListener(() {
    if (FFAppState().CurrentUser.id != 0 ||
        _CurrentListeningUser != FFAppState().CurrentUser.id) {
      if (FFAppState().CurrentUser.id != 0) {
        final user = CustomFirebaseUser(
            email: FFAppState().CurrentUser.email,
            uid: FFAppState().CurrentUser.id.toString(),
            displayName: FFAppState().CurrentUser.firstName +
                FFAppState().CurrentUser.lastName);
        AppStateNotifier.instance.update(user);
      }
      _CurrentListeningUser = FFAppState().CurrentUser.id;
      revenue_cat.login(FFAppState().CurrentUser.id.toString());
    }
  });
}

class CustomFirebaseUser extends BaseAuthUser {
  String email;
  String uid;
  String displayName;
  CustomFirebaseUser(
      {required this.email, required this.uid, required this.displayName});
  @override
  AuthUserInfo get authUserInfo => AuthUserInfo(
        uid: uid,
        email: email,
        displayName: displayName,
        photoUrl: '',
        phoneNumber: '',
      );

  @override
  Future? delete() {}
  @override
  Future? updateEmail(String email) async {}

  @override
  Future? updatePassword(String newPassword) async {}

  @override
  Future? sendEmailVerification() {}

  @override
  bool get emailVerified => true;

  @override
  Future refreshUser() async {}
  @override
  bool get loggedIn => true;
}
