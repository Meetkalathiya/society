import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. By using this application, you agree to comply with all terms and conditions outlined herein.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. Users are responsible for ensuring the accuracy of the information they provide through the application. Misleading or false information may lead to account suspension or termination.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. The society management reserves the right to update, modify, or discontinue the application or its features at any time without prior notice.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '4. The society management is not liable for any damages or losses incurred as a result of using the application, including but not limited to financial losses, data breaches, or system failures.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '5. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'By using this application, you agree to abide by these terms and conditions.',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TermsAndConditionsScreen(),
  ));
}
