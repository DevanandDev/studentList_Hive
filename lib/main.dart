import 'package:flutter/material.dart';
import 'package:hiv_app/Screen/login.dart';
import 'package:hiv_app/Screen/splash.dart';
import 'package:hiv_app/add.dart';
import 'package:hiv_app/home.dart';
import 'package:hiv_app/model/db_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(MyStudentsAdapter());

  await Hive.initFlutter();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyLog(),
    );
  }
}