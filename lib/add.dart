import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiv_app/function/db_function.dart';
import 'package:hiv_app/model/db_model.dart';
import 'package:image_picker/image_picker.dart';

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

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: _selectImage !=null?
                FileImage(_selectImage!)
                :AssetImage('assets/person.webp'), 
              ),
          
              TextButton(onPressed: (){
                
              gallery();
              }, child:Text('Add Image')),
          
              Gap(15),
          
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Name',
                ),
              ),
              Gap(10),
          
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Age',
                ),
              ),
          
              Gap(10),
          
              TextFormField(
                controller: clsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Class'
                ),
              ),
              Gap(10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: 'Address',
                ),
                
              ),
          
              Gap(10),
          
              ElevatedButton(onPressed: (){
                  submitButton();
              }, child: Text('Submit')),
           ],
          ),
        ),
      ),
    );
  }
  Future<void> submitButton()async{
    final name =nameController.text;
    final age =ageController.text;
    final cls =clsController.text;
    final address=addressController.text;

    if(name.isEmpty||age.isEmpty||cls.isEmpty||address.isEmpty)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter all fields')));
    }
    else{
      final student = MyStudents(name: name,
       age: age,
       cls: cls,
       address: address,
       image: _selectImage?.path??'',
       );
addStudent(student);
Navigator.of(context).pop();
    
        
       
    }

  }
      Future<void>gallery()async{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        _selectImage=File(image!.path);
      });
    }
}