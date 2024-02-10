import 'package:flutter/material.dart';
import 'package:society/Screen/signup_screen_two.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          height: 550,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black,width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [Image.asset('assets/images/1.png'),
                Text(
                  'Create an Account',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Last name',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Mobile.no',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Create Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Re-enter Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreento(),),);
                }, child: Text('Continue',style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
),),

                ],
              ),          
          ),
        ),
      ),
    );
  }
}