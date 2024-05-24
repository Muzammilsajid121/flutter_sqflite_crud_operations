import 'package:flutter/material.dart';
import 'package:sqflite_practice/secondmethod/second_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SecondHomeDatabase(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sqflite_practice/nashamethod/nash_dbhelper.dart';
// import 'package:sqflite_practice/nashamethod/nash_view.dart';
// import 'package:sqflite_practice/secondmethod/second_home.dart';



// DatabaseHelper dbhelper = DatabaseHelper();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); 
//   //await dbhelper.dropDatabase();

// // Initialize the new database
// await dbhelper.database;// Ensure all bindings are initialized
//   await dbhelper.database; // Initialize the database
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//        home: SecondHomeDatabase());
//   }
// }
