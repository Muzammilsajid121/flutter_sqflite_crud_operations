import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite_practice/nashamethod/nash_dbhelper.dart';
import 'package:sqflite_practice/nashamethod/nash_student_model.dart';
import 'package:sqflite_practice/nashamethod/nash_studentdetail.dart';


class DataBaseUI extends StatefulWidget {
  const DataBaseUI({super.key});

  @override
  State<DataBaseUI> createState() => _DataBaseUIState();
}

class _DataBaseUIState extends State<DataBaseUI> {
  DatabaseHelper dbHelper = DatabaseHelper();
  Studendetailed student = Studendetailed();
    
    

  Future getstudentdatafromtable() async {
    List<Map<String, dynamic>> getdatafromtable = await dbHelper.getData();
    List<Student> Cdataobj =
    
        getdatafromtable.map((map) => Student.fromMap(map)).toList();
     Cdataobj.forEach((student){ 
      if(student.name=='areeba'){
        
      }
     
       print('Student ID: ${student.id}');
    print('Name: ${student.name}');
    print('Email: ${student.email}');
    print('Age: ${student.age}');  
   // print('status:${student.status}')  ;
   } );
  }
 

    // Print table contents
    

  Future addvaleusintocol() async {
     await dbHelper.updateStatus(1, "Single");
    await dbHelper.updateStatus(2, "Student");
   List<Map<String, dynamic>> newenterdata = await dbHelper.getData();

    // Loop through the list and print each row.
    for (var row in newenterdata) {
      print('ID: ${row['id']}, Age: ${row['status']}');
    }
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () async{
               await  student.mystudentlist();
              },
              child: Text('SAVE'),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                getstudentdatafromtable();
              },
              child: Text('Get Data'),
            ),
            FloatingActionButton(onPressed:()async{
              
         await  addvaleusintocol();

            },
           child: Text('enter value '),
            )
          ],
        ),
      ),
    );
  }
}