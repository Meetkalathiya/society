import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrConfirmationScreen extends StatelessWidget {
  final String qrData;

  QrConfirmationScreen({required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEA7070),
      appBar: AppBar(
        title: Text('QR 확인'),
        backgroundColor: Color(0xFFEA7070),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '생성된 QR 코드',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            if (qrData.isNotEmpty)
              Container(
                  child: QrImageView(
            data: qrData, // Here is your QR data
    version: QrVersions.auto,
    size: 200.0,
  ),
),
            ],
          ),
        ),
      );
  }
}
