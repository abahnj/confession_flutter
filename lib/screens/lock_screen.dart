import 'dart:async';
import 'dart:io';

import 'package:confession_flutter/constants.dart';
import 'package:confession_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

typedef DeleteCode = void Function();
typedef PassCodeVerify = Future<bool> Function(List<int> passcode);

class LockScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  final VoidCallback fingerFunction;
  final bool fingerVerify;
  final String title;
  final int passLength;
  final bool showWrongPassDialog;
  final bool showFingerPass;
  final String wrongPassTitle;
  final String wrongPassContent;
  final String wrongPassCancelButtonText;
  final String bgImage;
  final Color numColor;
  final String fingerPrintImage;
  final Color borderColor;
  final Color foregroundColor;
  final PassCodeVerify passCodeVerify;

  LockScreen({
    required this.onSuccess,
    required this.title,
    required this.borderColor,
    this.foregroundColor = Colors.transparent,
    required this.passLength,
    required this.passCodeVerify,
    required this.fingerFunction,
    this.fingerVerify = false,
    this.showFingerPass = false,
    required this.bgImage,
    this.numColor = Colors.black,
    required this.fingerPrintImage,
    this.showWrongPassDialog = false,
    required this.wrongPassTitle,
    required this.wrongPassContent,
    required this.wrongPassCancelButtonText,
  }) : assert(passLength <= 8);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  var _currentCodeLength = 0;
  final _inputCodes = <int>[];
  var _currentState = 0;
  Color circleColor = Colors.white;

  void _onCodeClick(int code) {
    if (_currentCodeLength < widget.passLength) {
      setState(() {
        _currentCodeLength++;
        _inputCodes.add(code);
      });

      if (_currentCodeLength == widget.passLength) {
        widget.passCodeVerify(_inputCodes).then((onValue) {
          if (onValue) {
            setState(() {
              _currentState = 1;
            });
            widget.onSuccess();
          } else {
            _currentState = 2;
            Timer(Duration(milliseconds: 1000), () {
              setState(() {
                _currentState = 0;
                _currentCodeLength = 0;
                _inputCodes.clear();
              });
            });
            if (widget.showWrongPassDialog) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: AlertDialog(
                        title: Text(
                          widget.wrongPassTitle,
                          style: TextStyle(fontFamily: 'Open Sans'),
                        ),
                        content: Text(
                          widget.wrongPassContent,
                          style: TextStyle(fontFamily: 'Open Sans'),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              widget.wrongPassCancelButtonText,
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
          }
        });
      }
    }
  }

  void _fingerPrint() {
    if (widget.fingerVerify) {
      widget.onSuccess();
    }
  }

  void _deleteCode() {
    setState(() {
      if (_currentCodeLength > 0) {
        _currentState = 0;
        _currentCodeLength--;
        _inputCodes.removeAt(_currentCodeLength);
      }
    });
  }

  void _deleteAllCode() {
    setState(() {
      if (_currentCodeLength > 0) {
        _currentState = 0;
        _currentCodeLength = 0;
        _inputCodes.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      _fingerPrint();
    });
    return Theme(
      data: ThemeData(brightness: Utils.returnBrightness(context)),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagesRoot + 'splash.png'),
                ),
                color: Colors.white,
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: Platform.isIOS ? 60 : 40,
                                  ),
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Open Sans'),
                                  ),
                                  SizedBox(
                                    height: Platform.isIOS ? 50 : 30,
                                  ),
                                  CodePanel(
                                    codeLength: widget.passLength,
                                    currentLength: _currentCodeLength,
                                    borderColor: widget.borderColor,
                                    foregroundColor: widget.foregroundColor,
                                    deleteCode: _deleteCode,
                                    fingerVerify: widget.fingerVerify,
                                    status: _currentState,
                                  ),
                                  SizedBox(
                                    height: Platform.isIOS ? 30 : 15,
                                  ),
                                  Text(
                                    'INPUT PASSCODE',
                                    style: TextStyle(
                                        color: Colors.white70.withOpacity(0.3),
                                        fontSize: 18,
                                        fontFamily: 'Open Sans'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: Platform.isIOS ? 5 : 6,
                      child: Container(
                        padding: EdgeInsets.only(left: 0, top: 0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  buildContainerCircle(1),
                                  buildContainerCircle(2),
                                  buildContainerCircle(3),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  buildContainerCircle(4),
                                  buildContainerCircle(5),
                                  buildContainerCircle(6),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  buildContainerCircle(7),
                                  buildContainerCircle(8),
                                  buildContainerCircle(9),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  buildRemoveIcon(Icons.close),
                                  buildContainerCircle(0),
                                  buildContainerIcon(Icons.arrow_back),
                                ],
                              ),
                            ),
                            PlatformTextButton(
                              child: Text(
                                  'Unlock with ${Platform.isIOS ? 'Face ID' : 'Biometrics'}'),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainerCircle(int number) {
    return Expanded(
      child: MaterialButton(
        shape: CircleBorder(),
        onPressed: () => _onCodeClick(number),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRemoveIcon(IconData icon) {
    /*Positioned(
      top: MediaQuery.of(context).size.height /
          (Platform.isIOS ? 4 : 5),
      left: 20,
      bottom: 10,
      child: GestureDetector(
        onTap: () {
          widget.fingerFunction();
        },
        child: Image.asset(
          widget.fingerPrintImage,
          height: 40,
          width: 40,
          color: Colors.white,
        ),
      ),
    )*/
    return Expanded(
      child: Platform.isAndroid && widget.showFingerPass
          ? MaterialButton(
              height: 50,
              shape: CircleBorder(),
              onPressed: () => widget.fingerFunction(),
              child: Center(
                child: Image.asset(
                  widget.fingerPrintImage,
                  height: 30,
                  width: 30,
                  color: Colors.white,
                ),
              ),
            )
          : Container(),
    );
  }

  Widget buildContainerIcon(IconData icon) {
    return Expanded(
      child: MaterialButton(
        height: 50,
        shape: CircleBorder(),
        onPressed: () => (0 < _currentCodeLength) ? _deleteCode() : null,
        child: Center(
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class CodePanel extends StatelessWidget {
  final codeLength;
  final currentLength;
  final borderColor;
  final bool fingerVerify;
  final foregroundColor;
  final H = 30.0;
  final W = 30.0;
  final DeleteCode? deleteCode;
  final int status;

  CodePanel(
      {this.codeLength,
      this.currentLength,
      this.borderColor,
      this.foregroundColor,
      this.deleteCode,
      required this.fingerVerify,
      required this.status})
      : assert(codeLength > 0),
        assert(currentLength >= 0),
        assert(currentLength <= codeLength),
        assert(deleteCode != null),
        assert(status == 0 || status == 1 || status == 2);

  @override
  Widget build(BuildContext context) {
    var circles = <Widget>[];
    var color = borderColor;
    var circlePice = 1;

    if (fingerVerify == true) {
      do {
        circles.add(
          SizedBox(
            width: W,
            height: H,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 1.0),
                color: Colors.green.shade500,
              ),
            ),
          ),
        );
        circlePice++;
      } while (circlePice <= codeLength);
    } else {
      if (status == 1) {
        color = Colors.green.shade500;
      }
      if (status == 2) {
        color = Colors.red.shade500;
      }
      for (var i = 1; i <= codeLength; i++) {
        if (i > currentLength) {
          circles.add(SizedBox(
              width: W,
              height: H,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2.0),
                    color: foregroundColor),
              )));
        } else {
          circles.add(SizedBox(
              width: W,
              height: H,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 1.0),
                  color: color,
                ),
              )));
        }
      }
    }

    return SizedBox.fromSize(
      size: Size(MediaQuery.of(context).size.width, 30.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox.fromSize(
            size: Size(40.0 * codeLength, H),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: circles,
            )),
      ]),
    );
  }
}

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
