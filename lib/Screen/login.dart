import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:society/Screen/bottom_nav_screen.dart';
import 'package:society/Screen/otp_screen.dart';
import 'package:society/Screen/signup_screen.dart';
import 'package:society/Screen/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool _showPassword = true;
  String? numErrorText;
  String? passErrorText;

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? _verificationId; // Declare _verificationId here

  void navigateToSignup() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  void navigateToBottomNav() {
    setState(() {
      numErrorText =
          (numController.text.isEmpty) ? "Please enter a Mobile number" : null;
      passErrorText =
          (passController.text.isEmpty) ? "Please enter a Password" : null;
    });
    if (numErrorText == null && passErrorText == null) {
      // Perform phone number authentication here
      _authenticateWithPhoneNumber(numController.text);
    }
  }

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Future<void> _authenticateWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieve verification code
          await _auth.signInWithCredential(credential);
          print("Authentication Successful!");
          // Navigate to the desired screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed: $e");
        },
        codeSent: (String verificationId, int? resendToken) {
          // Store verification ID for later use
          setState(() {
            _verificationId = verificationId;
          });
          // Navigate to the OTP screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                verificationId: verificationId,
                mobileNumber: phoneNumber,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        timeout: const Duration(seconds: 120),
      );
    } catch (e) {
      print("Error authenticating with phone number: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SplashScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 85, 161, 223),
      body: Center(
        child: Container(
          width: 300,
          height: 550,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 3),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/1.png'),
                Text(
                  'Enter Your Detail',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: numController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Enter a Mobile number',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: numErrorText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: passController,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: passErrorText,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: toggleShowPassword,
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: navigateToBottomNav,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account?  "),
                    TextButton(
                      onPressed: navigateToSignup,
                      child: Text(
                        "Sign up.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
