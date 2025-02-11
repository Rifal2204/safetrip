import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safetrip/screens/adminhomescreen/AdminHome_Screen.dart.dart';
import 'package:safetrip/screens/DriverHome_Screen.dart';
import 'package:safetrip/screens/parentscreen/ParentHome_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

//--------------------ميثود انواع الحسابات----------//
class _RegisterScreenState extends State<RegisterScreen> {
  String selectedAccountType = 'نوع الحساب';
  final List<String> accountTypes = ['نوع الحساب', 'ولي أمر', 'سائق', 'مشرف'];

//----------------ميثود الجنس للافتار----------------------//
  String selectedGender = 'الجنس';
  final List<String> gender = ['الجنس', 'ذكر', 'أنثى'];

//----------------ميثود التحقق من النص المدخل انه عربي , لا يتجاوز اربعة اسماء----------//
  final TextEditingController _controller = TextEditingController();

  void _validateInput(String value) {
    List<String> words = value.trim().split(RegExp(r'\s+'));
    if (words.length > 4) {
      _controller.text = words.sublist(0, 4).join(' ');
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يُسمح بإدخال 4 أسماء فقط')),
      );
    }
  }

  //--------------ميثود رقم الهاتف -----------------------//
  bool startsWithZero(String number) {
    return number.isNotEmpty && number.startsWith('0');
  }

  TextEditingController phoneController = TextEditingController();

  void validatePhoneNumber() {
    String phoneNumber = phoneController.text;

    if (!startsWithZero(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يجب أن يبدأ الرقم بصفر')),
      );
    }
  }

  //---------------ميثود لتمرير اسم المستخدم للهوم بيج ---------//
  TextEditingController nameController = TextEditingController();

  void goToHomeScreen() {
    // الحصول على الاسم الأول فقط
    String firstName = nameController.text.split(' ').first;

    if (firstName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال الاسم')),
      );
      return;
    }

    Widget userScreen;

    if (selectedAccountType == 'ولي أمر') {
      userScreen = parentHomeScreen(gender: selectedGender, fullName: firstName,);
    } else if (selectedAccountType == 'سائق') {
      userScreen = DriverHomeScreen(gender: selectedGender, fullName: firstName,);
    } else if (selectedAccountType == 'مشرف') {
      userScreen = AdminHomeScreen(
        gender: selectedGender,
        fullName: firstName,
      );
    } else {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => userScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'إنشاء حساب',
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
              const SizedBox(height: 30),
              //-----------------------الاسم الرباعي------------------//
              TextField(
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium,
                controller: nameController, // Use only nameController

                decoration: InputDecoration(
                  hintText: 'الاسم الرباعي',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[\u0600-\u06FF\s]')),
                ],
                onChanged: _validateInput,
              ),

              const SizedBox(height: 30),

              //-------------- رقم الهوية --------------//
              TextField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              const SizedBox(height: 10),

              //-------------- اختيار الجنس --------------//
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: gender
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(
                            type,
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //-------------- اختيار نوع الحساب --------------//
              DropdownButtonFormField<String>(
                value: selectedAccountType,
                items: accountTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(
                            type,
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAccountType = value!;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //-------------- رقم الهاتف --------------//
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'رقم الهاتف',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) => validatePhoneNumber(),
              ),
              const SizedBox(height: 20),

              //-------------- كلمة المرور --------------//
              TextField(
                obscureText: true,
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
              const SizedBox(height: 20),

              //-------------- زر إنشاء الحساب --------------//
              MaterialButton(
                elevation: 3.0,
                color: Color.fromRGBO(255, 255, 255, 1),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                  if (selectedGender == 'الجنس' ||
                      selectedAccountType == 'نوع الحساب') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('يرجى ادخال البيانات في جميع الحقول')));
                    return;
                  }

                  goToHomeScreen(); // استدعاء الميثود لتمرير الاسم
                },
                child: const Center(
                  child: Text(
                    'إنشاء الحساب',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF498EB7),
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
