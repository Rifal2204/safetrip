import 'package:flutter/material.dart';
import 'package:safetrip/screens/adminhomescreen/settingscreen.dart';
import 'package:safetrip/screens/welcome_screen.dart';
class parentHomeScreen extends StatelessWidget {
  final String gender;
  final String fullName;

  const parentHomeScreen({super.key, required this.gender, required this.fullName});

//----------------ميثود كلمة الترحيب--------------//

  String get getGreetingMessage {
    final currentHour = DateTime.now().hour;
    String greeting = (currentHour >= 1 && currentHour < 12) ? "صباح الخير" : "مساء الخير";
    return "$greeting، $fullName";
  }

//-----------------ميثود الافتار----------------//

  String get genderImage => gender == 'أنثى' ? 'assets/photos/wmn.webp' : 'assets/photos/mn.webp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 30),
            _buildOptionButton(context, Icons.person, "حالة الطالب ", () {
              // ميثود حالة الطالب
            }),
            const SizedBox(height: 20),
            _buildOptionButton(context, Icons.schedule, "جدولة المواعيد", () {
              // ميثود صفحة جدولة المواعيد
            }),
            const SizedBox(height: 20),
            _buildOptionButton(context, Icons.history, "سجل الرحلات", () {
              // ميثود سجل الرحلات
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF44ABFF), Color(0xFFE2F069)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.settings, color: Color(0xFF44ABFF)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Color(0xFF44ABFF)),
                onPressed: () => _showLogoutDialog(context),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_active, color: Color(0xFF44ABFF)),
                onPressed: () {},
              ),
              Text(
                getGreetingMessage,
                style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(genderImage),
                radius: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return SizedBox(
      width: 300,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.blueAccent, width: 2),
          ),
          elevation: 5,
        ),
        icon: Icon(icon, color: Color(0xFF44ABFF), size: 28),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تأكيد تسجيل الخروج'),
          content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const welcomeScreen()),
                );
              },
              child: const Text('خروج'),
            ),
          ],
        );
      },
    );
  }
}
