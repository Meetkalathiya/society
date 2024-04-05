import 'package:flutter/material.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController countrycode = TextEditingController();
  bool _showPassword = true;

  String _firstName = '';
  String _lastName = '';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';

  bool _isValidFirstName = true;
  bool _isValidLastName = true;
  bool _isValidPhoneNumber = true;
  bool _isValidPassword = true;
  bool _isValidConfirmPassword = true;

  String? selectedWing;
  String? selectedUser;
  List<String> wings = ['A', 'B', 'C', 'D'];
  List<String> users = ['Secretary', 'Commitie Memeber', 'Society Member'];
  String wingAndFlatNo = ' ';

  void initstate(){
    countrycode.text = "+91";
    super.initState();
  }

  void ToshowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void validationofform() {
    setState(() {
      _isValidFirstName = _firstName.isNotEmpty;
      _isValidLastName = _lastName.isNotEmpty;
      _isValidPhoneNumber = _phoneNumber.isNotEmpty &&
          _phoneNumber.length == 10 &&
          countrycode.text.isNotEmpty;
      _isValidPassword = _password.isNotEmpty && _password.length >= 8;
      _isValidConfirmPassword =
          _confirmPassword == _password && _confirmPassword.isNotEmpty;
    });
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
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 85, 161, 223),
      body: Center(
        child: Container(
          width: 330,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('assets/images/1.png'),
                Text(
                  'Create an Account',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 1),
                Row( // First name and last name containers in a row
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
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
                            errorText: !_isValidFirstName
                                ? 'Please enter valid firstname'
                                : null,
                          ),
                          onChanged: (value) {
                            _firstName = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Last name',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            errorText: !_isValidLastName
                                ? 'Please enter valid lastname'
                                : null,
                          ),
                          onChanged: (value) {
                            _lastName = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      hint: Text('Your wing'),
                      value: selectedWing,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedWing = newValue;
                          wingAndFlatNo = (selectedWing != null)
                              ? '$selectedWing - Enter Flat no.'
                              : '';
                        });
                      },
                      items: wings.map((String wing) {
                        return DropdownMenuItem<String>(
                          value: wing,
                          child: Text(wing),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      hint: Text('Select a User'),
                      value: selectedUser,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUser = newValue;
                        });
                      },
                      items: users.map((String users) {
                        return DropdownMenuItem<String>(
                          value: users,
                          child: Text(users),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Container(   
                  height: 40, 
                  child:TextField(
                  decoration: InputDecoration(
                    labelText: 'EnterFlat no.',
                    
                  ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter a Mobile No.',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidPhoneNumber
                          ? 'Please enter valid Mobilename'
                          : null,
                    ),
                    onChanged: (value) {
                      _phoneNumber = value;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Create a Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidPassword
                          ? 'Please enter valid Password'
                          : null,
                      suffixIcon: IconButton(
                        onPressed: ToshowPassword,
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    onChanged: (value) {
                      _password = value;
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Re-Enter a Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: !_isValidConfirmPassword
                          ? 'entered password is not same'
                          : null,
                      suffixIcon: IconButton(
                        onPressed: ToshowPassword,
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    onChanged: (value) {
                      _confirmPassword = value;
                    },
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    // Add your navigation logic here
                  },                  
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}