import 'dart:convert';
import 'package:http/http.dart' as http;
import '../classes/student.dart';
import '../constants.dart';

class ApiService {
  Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse(kLocalHostUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => Student.fromJson(data)).toList();
    } else {
      throw Exception('Öğrenciler alınamadı');
    }
  }

}