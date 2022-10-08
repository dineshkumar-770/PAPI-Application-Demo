import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/Views/screens/login_screen.dart';
import 'package:riverpod_understanding/firebase/firebase_auth_repositary.dart';
import 'package:riverpod_understanding/firebase/firebase_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final data = ref.watch(authStateProvider);
      return Drawer(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.amber,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data.value == null
                    ? 'loading...'
                    : data.value!.email.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 17, color: Colors.amber),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                height: 10,
                color: Colors.amber,
              ),
              ListTile(
                onTap: () {
                  AuthWithFirebase().signOut(context);
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                leading: const Icon(
                  Icons.logout,
                  color: Colors.amber,
                ),
                title: const Text(
                  'SignOut',
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
