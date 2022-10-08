import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_understanding/Views/molecule/flutter_toast.dart';
import 'package:riverpod_understanding/Views/screens/login_screen.dart';
import 'package:riverpod_understanding/firebase/firebase_auth_repositary.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.xda-developers.com/files/2021/11/Google-Pixel-6-miscellaneous-wallpapers-4.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  'Registeration',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2.5, color: Colors.white)),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2.5, color: Colors.white)),
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Create password'),
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                  height: 50,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      onPressed: () {
                        AuthWithFirebase()
                            .signUp(emailController.text,
                                passwordController.text, context)
                            .then((value) {
                              ShowToast().showToast('DOne');
                            });
                      },
                      child: const Text('Register')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
