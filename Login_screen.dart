import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'تسجيل الدخول',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),

              //-----------------------الهوية----------------------//
              TextField(
                maxLength: 10, // عدد الأرقام المسموحة
                keyboardType: TextInputType.number, // الكيبورد الظاهر لليوزر
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // يسمح لليوزر بإدخال أرقام فقط
                ],
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'رقم الهوية',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //--------------------------كلمة المرور-----------------------------------//
              TextField(
                obscureText: true, // إخفاء النص (كلمة المرور)
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 90),

              //------------------------------------زر تسجيل الدخول--------------------------------//
              MaterialButton(
                elevation: 3.0,
                color: const Color.fromARGB(255, 255, 255, 255), // لون الزر
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                     // اضيف الاكشن اللي يصير اذا اليوزر ضغط عالزر//               
                },
                child: Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle( //تنسيقات النص
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF259EE4),
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
