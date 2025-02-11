import 'package:flutter/material.dart';
import 'package:safetrip/screens/welcome_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: const Text(
          "الإعدادات",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 45, 94, 113)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          const SizedBox(height: 30),

          _buildSettingsOption(
            icon: Icons.person,
            title: "بيانات الحساب",
            onTap: () {
              // الانتقال إلى صفحة بيانات الحساب
            },
          ),
          const SizedBox(height: 15), // المسافة بين الأزرار

          _buildSettingsOption(
            icon: Icons.help_outline,
            title: "المساعدة",
            onTap: () {
              // الانتقال إلى صفحة المساعدة
            },
          ),
          const SizedBox(height: 15), // المسافة بين الأزرار

          _buildSettingsOption(
            icon: Icons.phone,
            title: "اتصل بنا",
            onTap: () {
              // الانتقال إلى صفحة اتصل بنا
            },
          ),
          const SizedBox(height: 70), // المسافة بين الأزرار

          // زر "تسجيل الخروج" في أسفل الأزرار مع لون أيقونة أحمر
          _buildSettingsOption(
            icon: Icons.logout,
            title: "تسجيل الخروج ",
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('تأكيد تسجيل الخروج'),
                    content: const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('إلغاء'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const welcomeScreen()),
                          );
                        },
                        child: const Text('خروج'),
                      ),
                    ],
                  );
                },
              );
            },
            iconColor: Colors.red, // تغيير اللون إلى الأحمر
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor = const Color.fromARGB(255, 73, 127, 126), // القيمة الافتراضية
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10), // المسافة بين الأزرار
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15), // الحشو داخل الزر
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // الزوايا المدورة
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // تأثير الظل
              blurRadius: 5, // مدا الظل
              offset: Offset(0, 3), // مكان الظل
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // توسيط النص والأيقونة
          children: [
            Icon(icon, color: iconColor, size: 28), // الأيقونة مع اللون المخصص
            const SizedBox(width: 15), // المسافة بين الأيقونة والنص
            Text(
              title,  // النص
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Spacer(), // يفصل بين النص والسهم
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey), // السهم
          ],
        ),
      ),
    );
  }
}
