import 'package:flutter/material.dart';
import 'package:safetrip/screens/Login_screen.dart';
import 'package:safetrip/screens/Register_screen.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       //اللوقو
            const SizedBox(height: 90),

            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 70),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255), // لون الزر
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF498EB7), // لون النص
                ),
              ),
            ),

            const SizedBox(height: 20),

            // زر إنشاء حساب
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 70),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255), // لون الزر
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'إنشاء حساب',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF498EB7), // لون النص
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
