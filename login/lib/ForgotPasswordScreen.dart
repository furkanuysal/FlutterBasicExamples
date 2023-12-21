import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email ID',
                        hintText: 'Enter your EmailID',
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      ),
                      onChanged: (email) {
                        print('Entered text: $email'); // testing
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        hintText: 'Enter your new password',
                        icon: const Icon(Icons.password),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      onChanged: (newPassword) {
                        print('Entered text: $newPassword'); // testing
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    child: TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter your Confirm password',
                        icon: const Icon(Icons.password),
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        suffixIcon: IconButton(
                          icon: _obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (password) {
                        print('Entered text: $password'); // testing
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        // code testing
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white, // Change the text color
                          fontWeight: FontWeight.bold,
                          // fontSize: 20,
                        ),
                      ),
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
