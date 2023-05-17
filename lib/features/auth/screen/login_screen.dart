import 'package:flutter/material.dart';
import 'package:reddit_clone/core/common/sign_in_botton.dart';
import 'package:reddit_clone/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              )) 
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              'Dive into anything',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 330,
              // width: 400,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(Constants.imotPath))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SignInButton()
        ],
      ),
    );
  }
}
