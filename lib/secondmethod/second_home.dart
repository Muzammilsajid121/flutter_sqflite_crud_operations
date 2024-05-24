import 'package:flutter/material.dart';
import 'package:sqflite_practice/secondmethod/sec_db_helper.dart';
import 'package:sqflite_practice/secondmethod/student_model.dart';

class SecondHomeDatabase extends StatefulWidget {
  const SecondHomeDatabase({super.key});

  @override
  State<SecondHomeDatabase> createState() => _SecondHomeDatabaseState();
}

class _SecondHomeDatabaseState extends State<SecondHomeDatabase> {
  SecondDatabaseHelper secondDatabaseHelper = SecondDatabaseHelper();
  List<Student> _students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Database')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //INSERT BUTTON
          ElevatedButton(
            onPressed: () async {
              List<Student> students = [
                Student(name: 'Muzammil Sajid', email: 'pc.209@gmail.com', age: 20, status: 'Single', height: 5.8),
                Student(name: 'Laiba', email: 'laiba46@gmail.com', age: 19, status: 'Married', height: 5.3),
                Student(name: 'Bismah', email: 'bismah26@gmail.com', age: 20, status: 'Single', height: 5.6),
              ];
              await secondDatabaseHelper.insertStudents(students); // Corrected method call
              print('Students Inserted');
            },
            child: const Text('Insert Students'),
          ),

          //READ BUTTON
          ElevatedButton(
            onPressed: () async {
              List<Student> students = await secondDatabaseHelper.getStudents();
              setState(() {
                _students = students;
              });
              students.forEach((student) {
                print('Name: ${student.name}, Email: ${student.email}, Age: ${student.age}, Status: ${student.status}, Height: ${student.height}');
              });
            },
            child: const Text('Read Students'),
          ),


          //DELETE BUTTON
            // DELETE BUTTON
          ElevatedButton(
            onPressed: () async {
              if (_students.isNotEmpty) {
                int studentId = _students.last.id!;
                await secondDatabaseHelper.deleteStudent(studentId);
                print('Student with ID $studentId deleted');
                // _loadStudents(); // Refresh the list after deletion
              } else {
                print('No students to delete');
              }
            },
            child: const Text('Delete Last Student'),
          ),



          Expanded(
            child: ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name: ${_students[index].name}'),
                  subtitle: Text('Email: ${_students[index].email}'),
                  trailing: Text('Status: ${_students[index].status}'),
                  leading: Text('Height: ${_students[index].height}, Age: ${_students[index].age}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

