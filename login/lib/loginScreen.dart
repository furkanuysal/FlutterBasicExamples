import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ForgotPasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map<String, List<String>> credentials = {
    "email": [
      "mmcdoctor@regenboogindia.org",
      "registration",
      "doctor",
      "nurs",
      "test",
    ],
    "password": [
      "Doctor",
      "registration",
      "doctor",
      "nurs",
      "test",
    ],
  };
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                        height: 150, "lib/asset/yout company logo.png")),
                const Gap(50),
                const Center(
                  child: Text(
                    "Welcomt to Your Company name",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                  child: SizedBox(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        TextField(
                          controller: _userEmail,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                            hintText: "example@regenboogindia.org",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                          ),
                        ),
                        const Gap(25),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        TextField(
                          obscureText: _obscureText,
                          controller: _userPassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                        const Gap(45),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              checkCredential(
                                  _userEmail.text, _userPassword.text);
                            },
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black87,
                              primary: Colors.blue[600],
                              minimumSize: const Size(150, 46),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            child: const Text(
                              'LOG IN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Center(
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (CheckEmai()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen()));
                              }
                            },
                            child: const Text(
                              'Forgot your password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  int checkCredential(String enteredEmail, String enteredPassword) {
    List<String>? emailList = credentials["email"];
    List<String>? passwordList = credentials["password"];

    if (emailList == null || passwordList == null) {
      showLoginStatusMessage("Invalid credentials configuration.");
      return 0;
    }

    for (int i = 0; i < emailList.length; i++) {
      if (emailList[i] == enteredEmail && passwordList[i] == enteredPassword) {
        showLoginStatusMessage("Login Success.");
        return i + 1;
      }
      print(credentials["email"]?[i]);
    }

    showLoginStatusMessage("Incorrect Email or Password.");
    return 0;
  }

  showLoginStatusMessage(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  bool CheckEmai() {
    String enteredEmail = _userEmail.text;
    int Length = credentials["email"]!.length;
    if (enteredEmail.isNotEmpty) {
      return true;
    }
    for (int i = 0; i < Length; i++) {
      if (credentials["email"]?[i] == enteredEmail) {
        showLoginStatusMessage("Login Success.");
        return true;
      }
    }
    showLoginStatusMessage("please enter valid Email ID.");
    return false;
  }
}
