import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAll extends StatefulWidget {
  const AddAll({super.key});

  @override
  State<AddAll> createState() => _AddAllState();
}

class _AddAllState extends State<AddAll> {
  final nameController =TextEditingController();
  final ageController = TextEditingController();
  final clsController = TextEditingController();
  final addressController = TextEditingController();
  File? _selectImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: _selectImage !=null?FileImage(_selectImage!):AssetImage('assets/images/IMG_4364-Photoroom.png'),
          ),

          TextButton(onPressed: (){}, child:Text('Add Image')),

          Gap(15),

          TextFormField(
            controller: nameController,
          )
        ],
      ),
    );
  }
}