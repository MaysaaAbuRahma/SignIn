import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final user = FirebaseAuth.instance.currentUser;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Welcome! You have successfully \n                    logged in",
                style: GoogleFonts.aclonica(
                  fontSize: 22,
                ),
              ),
            ),
            Text(
              user!.email!,
              style: GoogleFonts.aclonica(
                fontSize: 22,
              ),
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.red[800],
              child: const Text("Sign Out"),
            )
          ],
        )),
      ),
    );
  }
}
