import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddstudentScreen extends StatefulWidget {
  const AddstudentScreen({super.key});

  @override
  State<AddstudentScreen> createState() => _AddstudentState();
}

class _AddstudentState extends State<AddstudentScreen> {
  // متغيرات المرحلة الدراسية والصف الدراسي
  String selectedEductionType = 'المرحلة الدراسية';
  final List<String> EductionTypes = ['المرحلة الدراسية', 'الثانوية', 'المتوسطة', 'الابتدائية'];

  String selectedGrade = 'الصف';
  final List<String> grades = ['الصف', 'الأول', 'الثاني', 'الثالث', 'الرابع', 'الخامس', 'السادس'];

  // متغيرات الجنس
  String selectedGender = 'الجنس';
  final List<String> gender = ['الجنس', 'ذكر', 'أنثى'];

  // متغيرات صلة القرابة
  //String selectedRelation = 'صلة القرابة';
  //final List<String> relations = ['صلة القرابة', 'أب', 'أم', 'أخ', 'أخت', 'جد', 'جدة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'إضافة بيانات طالب',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),

            //-------------- الاسم الرباعي للطالب --------------//
            TextField(
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'الاسم الرباعي للطالب',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //-------------- رقم الهوية للطالب --------------//
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'رقم الهوية للطالب',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

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
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //-------------- اختيار المرحلة الدراسية --------------//
            DropdownButtonFormField<String>(
              value: selectedEductionType,
              items: EductionTypes
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
                  selectedEductionType = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //-------------- اختيار الصف --------------//
            DropdownButtonFormField<String>(
              value: selectedGrade,
              items: grades
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
                  selectedGrade = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
//---------------------------- الفصل-------------------------//
          TextField(
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: ' الفصل ',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
           const SizedBox(height: 20),
            //-------------- الاسم الرباعي لولي الأمر --------------//
            TextField(
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'اسم ولي الأمر (رباعي)',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //-------------- رقم الهوية لولي الأمر --------------//
            TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'رقم الهوية لولي الأمر',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //-------------- صلة القرابة --------------//
          TextField(
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: ' صلة القرابة  ',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

//--------------------------------- المعرف الخاص بحساب ولي الامر----------------//
       TextField(
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'انشئ المعرف الخاص لحساب ولي الأمر',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            //-------------- زر حفظ البيانات --------------//
            const SizedBox(height: 20),
            Center(
              child: MaterialButton(
                elevation: 3.0,
                color: const Color(0xFF02799A),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {},
                child: const Text(
                  'حفظ البيانات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
