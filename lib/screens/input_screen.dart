import 'package:elearning/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../api/google_sign_in_api.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purpleAccent, Colors.orangeAccent]),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () async {
                await signIn(context);
              },
              child: Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: const Color(0xFF01539D),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: 66.0,
                      height: 66.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/google_icon.jpg',
                          width: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );


  }
  Future signIn(BuildContext context) async {
    final user =  await GoogleSignInApi.login();
    if (user == null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign in failed!")));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
    }
  }

}
