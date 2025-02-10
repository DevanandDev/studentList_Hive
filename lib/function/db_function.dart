

import 'package:flutter/widgets.dart';
import 'package:hiv_app/model/db_model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<MyStudents>> StudentListNotifier =ValueNotifier([]);

Future<void> addStudent(MyStudents value) async{
  final studentDB= await Hive.openBox<MyStudents>('database');
  await studentDB.add(value);
  getMyStudents();
}


//fetching our added data

Future<void>getMyStudents()async{
  final studentDB= await Hive.openBox<MyStudents>('database');
  StudentListNotifier.value.clear();
  StudentListNotifier.value.addAll(studentDB.values);
  StudentListNotifier.notifyListeners(); //ui update cehyyan
}

// deleting fields for using index 

 Future<void>deleteStudent(int index)async{
  final studentDB=await Hive.openBox<MyStudents>('database');
  studentDB.deleteAt(index);
  getMyStudents();
 }                                                                                                                                                                                                                                                                                                                                   
 Future<void>updateStudent(MyStudents value,int index) async{
  final studentDB=await Hive.openBox<MyStudents>('database');
  studentDB.putAt(index, value);
  getMyStudents();
 }