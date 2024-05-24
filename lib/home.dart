import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite_practice/services/db_helper.dart';

class HomeDatabase extends StatefulWidget {
  const HomeDatabase({super.key});

  @override
  State<HomeDatabase> createState() => _HomeDatabaseState();
}

class _HomeDatabaseState extends State<HomeDatabase> {

  //object for accessing
  DatabaseHelper databaseHelper = DatabaseHelper();

    List<Map<String, dynamic>> _data = []; // State variable to hold retrieved data
    String  name = "";
    String  email = "";
    int? age ;
    String status = '';
    Double? height;

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const   SizedBox(height: 200,),

   // Inserting data
          ElevatedButton(onPressed: () async{
             Map<String, dynamic> row = {
             'name': name,
             'email': 'pc.209@gmail.com',
             'age':    20,
             'status' : 'Married',
             'height' :  5.8 ,

             };
            await databaseHelper.insertData(row);
            print('Data is Inserted: $row');
          }, child: const Text("create")),
      

      // Reding data
          ElevatedButton(
            onPressed: () async {
          List<Map<String, dynamic>> rows = await databaseHelper.queryData();
      
            setState(() {
              _data = rows; // Update state with retrieved data
            });
          
          // Printing data
          rows.forEach((row) {
    print(
      'Data is Read: Name: ${row['name']}, Email: ${row['email']}, Status: ${row['status']},  Age: ${row['age']},  Heught: ${row['height']}');
          });
        },
          child: const Text("read")),
      
          ElevatedButton(onPressed: (){}, child: const Text("update")),
      
          ElevatedButton(onPressed: (){}, child: const Text("delete")),
      
          //TWXT
           // Display retrieved data in a ListView
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name: ${_data[index]['name']}'),
                  subtitle: Text('Email: ${_data[index]['email']}'),
                  trailing: Text('Status: ${_data[index]['status']}'),
                  leading: Text('Height: ${_data[index]['height']},Age: ${_data[index]['age']}'),
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}