import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hiv_app/function/db_function.dart';
import 'package:hiv_app/model/db_model.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.index,
      required this.name,
      required this.age,
      required this.cls,
      required this.address,
      required this.image});

  final int index;
  final String name;
  final String age;
  final String cls;
  final String address;
  final dynamic image;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController nameEditController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController clsEditingController = TextEditingController();
  final TextEditingController AddressEdtingController = TextEditingController();
  File? _selectImage1;

  @override
  void initState() {
    nameEditController.text = widget.name;
    ageEditingController.text = widget.age;
    clsEditingController.text = widget.cls;
    AddressEdtingController.text = widget.address;
    _selectImage1 = widget.image != null ? File(widget.image) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Your Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: _selectImage1 != null
                      ? FileImage(_selectImage1!)
                      : AssetImage('hiv_app/assets/person.webp'),
                ),
                TextButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text('Add Image')),
                Gap(10),
                TextField(
                  controller: nameEditController,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Gap(10),
                TextField(
                  controller: ageEditingController,
                  decoration: InputDecoration(
                      hintText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Gap(10),
                TextField(
                  controller: clsEditingController,
                  decoration: InputDecoration(
                      hintText: 'Class',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                Gap(10),
                TextField(
                  controller: AddressEdtingController,
                  decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                Gap(10),
                ElevatedButton(onPressed: () {
                  UpadateBtn();
                }, child: Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void UpadateBtn() {
    final eName = nameEditController.text.trim();
    final eAge = ageEditingController.text.trim();
    final eClass = clsEditingController.text.trim();
    final eAddress = AddressEdtingController.text.trim();
    final image1 = _selectImage1?.path ?? '';

    if (eName.isEmpty || eAge.isEmpty || eClass.isEmpty || eAddress.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Enter all fields')));
      return;
    }

    final editStudent = MyStudents(
        name: eName, 
        age: eAge, 
        cls: eClass, 
        address: eAddress, 
        image: image1);

        updateStudent(editStudent, widget.index);
        Navigator.of(context).pop();
  }

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectImage1 = File(pickedImage.path);
      });
    }
  }
}
