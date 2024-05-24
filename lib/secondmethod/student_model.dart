class Student {
  final int? id; // Primary key, nullable for new entries
  final String name;
  final String email;
  final int age;
  final String status;
  final double height;

  Student({
    this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.status,
    required this.height,
  });

  // Convert a Student into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'status': status,
      'height': height,
    };
  }

  // Convert a Map into a Student
  static Student fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      age: map['age'],
      status: map['status'],
      height: map['height'],
    );
  }
}
