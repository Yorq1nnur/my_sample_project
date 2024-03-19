import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_sample_project/firebase_options.dart';
import 'package:my_sample_project/screens/login_screen.dart';
import 'package:my_sample_project/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => LoginViewModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
