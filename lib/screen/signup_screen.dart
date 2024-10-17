import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifypasswordController = TextEditingController();

  Future<void> signup() async {
    if (passwordVerify()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // الانتقال إلى الشاشة الرئيسية بعد التسجيل الناجح
        Navigator.of(context).pushNamed('/');
      } catch (e) {
        // معالجة الأخطاء إذا حدثت
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
    }
  }

  bool passwordVerify() {
    return _passwordController.text.trim() ==
        _verifypasswordController.text.trim();
  }

  void openSignInScreen(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed('signinScreen'); // تأكد من الاسم الصحيح
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _verifypasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 127, 127),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "images/pngegg (1).png",
              height: 250,
            ),
            const SizedBox(height: 20),
            Text(
              "SIGNUP",
              style:
                  GoogleFonts.oswald(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome! now you can sign up :-)",
              style: GoogleFonts.bebasNeue(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black, width: 1.0), // إطار باللون الأسود
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black, width: 1.0), // إطار باللون الأسود
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _verifypasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Verify password",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black, width: 1.0), // إطار باللون الأسود
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: signup,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "sign up",
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account?",
                  style: GoogleFonts.outfit(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => openSignInScreen(context),
                  child: Text(
                    " sign in now!",
                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
