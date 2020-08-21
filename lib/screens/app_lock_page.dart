import 'dart:io' show Platform;

import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/screens/app_lock.dart';
import 'package:confession_flutter/screens/lock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PassCodeScreenState createState() => _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  bool isFingerprint = false;

  Future<Null> biometrics() async {
    final auth = LocalAuthentication();
    var authenticated = false;

    var availableBiometrics = await auth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
    }

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          iOSAuthStrings: iosStrings,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myPass = [1, 1, 1, 1];
    return LockScreen(
        title: 'Enter Pin Code',
        passLength: myPass.length,
        bgImage: imagesRoot + 'confession_lock.png',
        fingerPrintImage: imagesRoot + 'fingerprint.png',
        showFingerPass: true,
        fingerFunction: biometrics,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: false,
        wrongPassContent: 'Wrong pass please try again.',
        wrongPassTitle: 'Opps!',
        wrongPassCancelButtonText: 'Cancel',
        passCodeVerify: (passcode) async {
          for (var i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }

          return true;
        },
        onSuccess: () => AppLock.of(context).didUnlock());
  }
}
