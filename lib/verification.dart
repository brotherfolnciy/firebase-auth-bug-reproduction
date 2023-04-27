import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<String> sendCode(String phone) async {
  if (kIsWeb) {
    return await FirebaseAuth.instance
        .signInWithPhoneNumber(phone)
        .then((r) => r.verificationId);
  } else {
    final completer = Completer<String>();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, _) => completer.complete(verificationId),
      verificationFailed: (error) => completer.completeError(error),
      verificationCompleted: (_) {},
      codeAutoRetrievalTimeout: (_) {},
    );
    return await completer.future;
  }
}

Future<String> verifyCode(
  String code, {
  required String verificationId,
}) async {
  final phoneAuth = PhoneAuthProvider.credential(
    verificationId: verificationId,
    smsCode: code,
  );
  final cred = await FirebaseAuth.instance.signInWithCredential(phoneAuth);
  final uid = cred.user?.uid;
  if (uid == null) throw 'No user';
  return uid;
}
