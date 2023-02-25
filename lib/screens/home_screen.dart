import 'package:elearning/api/google_sign_in_api.dart';
import 'package:elearning/screens/input_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required user}) : super(key: key);
  dynamic user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Elearning App"), actions: [
        IconButton(
          onPressed: () async {
            await GoogleSignInApi.logout();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const InputScreen(),
              ),
            );
          },
          icon: Icon(Icons.logout),
        ),
      ]),
      body: Container(),
    );
  }
}
