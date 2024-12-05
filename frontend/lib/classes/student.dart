class Student {
  final int id;
  final String firstName;
  final String lastName;
  final int departmentId;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.departmentId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ogrenciID'],
      firstName: json['ad'],
      lastName: json['soyad'],
      departmentId: json['bolumId'],
    );
  }
}
