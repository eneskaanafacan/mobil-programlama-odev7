import 'package:flutter/material.dart';
import 'package:proje/classes/student.dart';
import 'package:proje/widgets/customAppBar.dart';
import '../services/apiService.dart';

class StudentListScreen extends StatelessWidget {
   StudentListScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: 'Ogrenci Listesi'),
      body: FutureBuilder<List<Student>>(
        future: apiService.fetchStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Hiç öğrenci bulunamadı'));
          } else {
            var students = snapshot.data!;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                var student = students[index];
                return ListTile(
                  title: Text('${student.firstName} ${student.lastName}'),
                  subtitle: Text('Bölüm: ${student.departmentId}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
