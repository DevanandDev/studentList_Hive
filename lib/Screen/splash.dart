import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hiv_app/Screen/login.dart';
import 'package:hiv_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplahs extends StatefulWidget {
  const MySplahs({super.key});

  @override
  State<MySplahs> createState() => _MySplahsState();
}

class _MySplahsState extends State<MySplahs> {
  @override
  void initState() {
   
    super.initState();
    Timer(Duration(seconds: 3), () {
      _checklogin(context);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),    
      ),
    );
  }

  Future<void> _checklogin(BuildContext context)async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final isLoged = pref.getBool('islogged') ?? false;

    if(isLoged){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> MyHome()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>MyLog()));
    }
  }
}