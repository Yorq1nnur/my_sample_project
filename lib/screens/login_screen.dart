import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_sample_project/screens/home_screen.dart';
import 'package:my_sample_project/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    User? user = FirebaseAuth.instance.currentUser;
    Future.microtask(() {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              onChanged: context.read<LoginViewModel>().updateEmail,
              decoration: const InputDecoration(hintText: "EMAIL"),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: const InputDecoration(hintText: "PASSWORD"),
              onChanged: context.read<LoginViewModel>().updatePassword,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<LoginViewModel>().login(context);
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
