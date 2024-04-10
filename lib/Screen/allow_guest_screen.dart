import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRCodeGeneratorScreen(),
    );
  }
}

class QRCodeGeneratorScreen extends StatefulWidget {
  @override
  _QRCodeGeneratorScreenState createState() => _QRCodeGeneratorScreenState();
}

class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
  String _qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _qrData = value;
                  });
                },
              ),
              SizedBox(height: 20),
              if (_qrData.isNotEmpty)
                QrImage(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}