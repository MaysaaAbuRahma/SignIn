import 'package:flutter/material.dart';
import 'package:signin/screen/auth.dart';
//import 'package:signin/screen/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signin/screen/home_screen.dart';
import 'package:signin/screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAfdwR7E-OB-XrLwI-MNDTMcssNgHoTyQs",
      appId: "1:178661811373:android:f907cecc39550327fa5224",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      projectId: "sign-in-app-188b4",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: Auth(),
      routes: {
        '/': (context) => const Auth(),
        'homaScreen': (context) => const HomeScreen(),
        'signupScreen': (context) => const SignupScreen(),
        'signinScreen': (context) => const SignupScreen(),
      },
    );
  }
}
