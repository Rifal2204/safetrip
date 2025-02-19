import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safetrip/screens/DriverHome_Screen.dart';
import 'package:safetrip/screens/adminhomescreen/AdminHome_Screen.dart.dart';
import 'package:safetrip/screens/parentscreen/ParentHome_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String accountType;
  final bool isLogin;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.accountType,
    this.isLogin = false,
  });

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String verificationId = '';
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  void verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        navigateToHome();
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ في التحقق: ${e.message}')),
        );
      },
      codeSent: (String id, int? resendToken) {
        setState(() {
          verificationId = id;
        });
      },
      codeAutoRetrievalTimeout: (String id) {
        setState(() {
          verificationId = id;
        });
      },
    );
  }

  void verifyOtp(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      navigateToHome();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('رمز التحقق غير صحيح')),
      );
    }
  }

  void navigateToHome() {
    Widget homeScreen;
    if (widget.accountType == 'ولي أمر') {
      homeScreen = parentHomeScreen(gender: '', fullName: '',);
    } else if (widget.accountType == 'سائق') {
      homeScreen = DriverHomeScreen(gender: '', fullName: '',);
    } else {
      homeScreen = AdminHomeScreen(gender: '', fullName: '',);
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("التحقق من رقم الهاتف")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("أدخل رمز التحقق"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (_) => const TextfieldOTP()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // قم بجلب رمز التحقق من الحقول
                String otpCode = '123456';
                verifyOtp(otpCode);
              },
              child: const Text("تحقق"),
            ),
          ],
        ),
      ),
    );
  }
}

class TextfieldOTP extends StatelessWidget {
  const TextfieldOTP({super.key});

  @override
  Widget build(BuildContext context) {
    final double fieldSize = MediaQuery.of(context).size.width / 7;
    return Container(
      width: fieldSize,
      height: fieldSize,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 116, 159, 1),
        border: Border.all(width: 1.5, color: const Color.fromRGBO(24, 116, 159, 1)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: const TextStyle(fontSize: 30),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
