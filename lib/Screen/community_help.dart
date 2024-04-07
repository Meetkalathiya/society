import 'dart:html';

import 'package:flutter/material.dart';

class CommunityHelp extends StatefulWidget {
  const CommunityHelp({Key? key}) : super(key: key);

  @override
  State<CommunityHelp> createState() => _CommunityHelpState();
}

class _CommunityHelpState extends State<CommunityHelp> {
  late TextEditingController _textFieldController;
  String _submittedText = '';

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Help'),
      ),
      
      body: Container(
        width: 800,
        height: 170,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: 'Enter your request here',
              ),
            ),
            SizedBox(height: 20), // Adding some space between text field and button
            ElevatedButton(
              
              onPressed: () {
                // Handle submit button press
                String request = _textFieldController.text;
                // You can perform actions with the request text here
                print('Submitted request: $request');
                setState(() {
                  _submittedText = request;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900], // Changing button color to black
                minimumSize: Size(50, 30), // Setting minimum button size
              ),
              child: Text('Submit',style:TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text(_submittedText),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CommunityHelp(),
  ));
}
