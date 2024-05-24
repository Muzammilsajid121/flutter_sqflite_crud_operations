import 'package:flutter/material.dart';
import 'package:sqflite_practice/services/db_helper.dart';

class HomesssDatabase extends StatefulWidget {
  const HomesssDatabase({super.key});

  @override
  State<HomesssDatabase> createState() => _HomeDatabaseState();
}

class _HomeDatabaseState extends State<HomesssDatabase> {

  //object for accessing
  DatabaseHelper databaseHelper = DatabaseHelper();


  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async{
                Map<String, dynamic> row = {
                  'name' : 'Muzammil',
                  'email': 'pc.20@gmail.com',

                };
                await databaseHelper.insertData(row);
                print("Data is inserted $row");
            
            }, child: const Text("create")),
        
            ElevatedButton(
              onPressed: () async {
           
          },
            child: const Text("read")),
        
            ElevatedButton(onPressed: (){}, child: const Text("update")),
        
            ElevatedButton(onPressed: (){}, child: const Text("delete")),
        
            //TWXT
             // Display retrieved data in a ListView
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _data.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text('Name: ${_data[index]['name']}'),
            //         subtitle: Text('Email: ${_data[index]['email']}'),
            //       );
            //     },
            //   ),
            // ),
            
          ],
        ),
      ),
    );
  }
}