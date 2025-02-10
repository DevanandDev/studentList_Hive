import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiv_app/function/db_function.dart';

class studentDetails extends StatelessWidget {
  String name;
  String age;
  String cls;
  String address;
  dynamic image;
   studentDetails({super.key,
   required this.name,
   required this.age,
   required this.cls,
   required this.address,
   required this.image
   });

  @override
  Widget build(BuildContext context) {
    getMyStudents();
    return Scaffold(
      appBar: AppBar(),

      body:Container(
        child: Column(
          children: [
            
            CircleAvatar(
              radius: 70 ,
              backgroundImage: image != null? FileImage(File(image)):AssetImage('assets/IMG_4364-Photoroom.png'),
            ),

            Row(  children: [Text('Name : '),Text('$name') ],),
            Gap(10),
            Row( children: [Text('Age : '),Text('$age')],),
            Gap(10),
            Row(children: [Text('Class : '),Text('$cls')],),
            Gap(10),
            Row(children: [Text('Address : '),Text('$address')],),
            Gap(15),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade200,
                
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
             child: Text('Back'))

          ],
        ),
      ) ,

    );
  }
}