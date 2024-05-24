import 'package:sqflite_practice/nashamethod/nash_dbhelper.dart';
import 'package:sqflite_practice/nashamethod/nash_student_model.dart';


class Studendetailed {
  Studendetailed() {}

  DatabaseHelper dbhelper = DatabaseHelper();

 Future <void> mystudentlist()async {
    List<Student> students = [
      Student(
        id: 1,
        name: 'nashra',
        email: 'nashraakram2003@mail.com',
        age: 20,
      //  status: 'Single'
        
        
      ),
      Student(
        id: 2,
        name: 'areeba',
        email: 'areebaakraam@gmail.com',
        age: 17,
       // status: "single"
       
      )
    ];
     List<Map<String, dynamic>> studentMaps = students.map((student) => student.toMap()).toList();//kio k insert function list of map expect kra h 
   await dbhelper.insertData(studentMaps);
  }
}