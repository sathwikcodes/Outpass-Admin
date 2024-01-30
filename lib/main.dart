import 'package:flutter/material.dart';
// import 'package:outpassv2/ScanQrPage.dart';
import 'package:securityoutpass/scanQrPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScanQRPage(),
    );
  }
}
