import 'dart:convert'; import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:http/http.dart' as http;

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  String scannedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Scanned Data:',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          Text(
            scannedData,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: scanQRCode,
            child: Text('Scan QR Code'),
          ),
        ],
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      String? result = await scanner.scan();
      setState(() {
        scannedData = result ?? 'No QR code scanned!';
      });

      // After scanning, send an SMS
      sendSmsToParent(scannedData);
    } catch (e) {
      print('Error scanning QR code: $e');
    }
  }

  Future<void> sendSmsToParent(String scannedData) async {
    final twilioAccountSid = 'AC09d8374651fd0d92c7118480975d618b';
    final twilioAuthToken = '2555116f8ff56de68afb5bf08377cb62';
    final twilioPhoneNumber = '+12676224062';

    // Remove any non-numeric characters from the scanned data
    final cleanedPhoneNumber = scannedData.replaceAll(RegExp(r'[^0-9]'), '');

    // If the number starts with '0', assume it's an Indian number and remove the leading '0'
    final formattedPhoneNumber = cleanedPhoneNumber.startsWith('0')
        ? cleanedPhoneNumber.substring(1)
        : cleanedPhoneNumber;

    // Add the country code for India
    final fullPhoneNumber = '+91$formattedPhoneNumber';

    final url = Uri.parse(
        'https://api.twilio.com/2010-04-01/Accounts/$twilioAccountSid/Messages.json');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('$twilioAccountSid:$twilioAuthToken')),
      },
      body: {
        'To': fullPhoneNumber,
        'From': twilioPhoneNumber,
        'Body': 'Your child just started going out. Stay informed!',
      },
    );

    if (response.statusCode == 201) {
      print('SMS sent successfully!');
    } else {
      print(
          'Failed to send SMS. Status Code: ${response.statusCode}, Response: ${response.body}');
    }
  }
}
