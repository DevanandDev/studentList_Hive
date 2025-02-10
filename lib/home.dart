import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hiv_app/add.dart';
import 'package:hiv_app/details.dart';
import 'package:hiv_app/editscreen.dart';
import 'package:hiv_app/function/db_function.dart';
import 'package:hiv_app/model/db_model.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String search = '';
  List<MyStudents> searchList = [];

  

  studentUpdate() {
    getMyStudents();
    searchList = StudentListNotifier.value
        .where((std) => std.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMyStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'search',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                search = value;
                studentUpdate();
              });
            },
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddAll()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: StudentListNotifier,
              builder:
                  (BuildContext, List<MyStudents> studentList, Widget? child) {
                return search.isNotEmpty
                    ? searchList.isEmpty
                        ? Center(
                            child: Text('result not found'),
                          )
                        : _buildStudentList(searchList)
                    : _buildStudentList(studentList);
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildStudentList(List<MyStudents> student) {
  return student.isEmpty
      ? Center(
          child: Text('no students are available'),
        )
      : ListView.separated(
          itemBuilder: (context, index) {
            final data = student[index];

            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => studentDetails(
                              name: data.name.toString(),
                              age: data.age.toString(),
                              cls: data.cls.toString(),
                              address: data.address.toString(),
                              image: data.image,
                            )));
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => EditScreen(
                                    name: data.name.toString(),
                                    age: data.age.toString(),
                                    cls: data.cls.toString(),
                                    address: data.address.toString(),
                                    index: index,
                                    image: data.image!)));
                      },
                      icon: Icon(Icons.edit)),

                  IconButton(onPressed: () {
                    deleteStudent(index);
                  },
                   icon: Icon(Icons.delete)),
                ],
              ),
              leading: CircleAvatar(
                backgroundImage: data.image != null
                    ? FileImage(
                        File(data.image!),
                      )
                    : AssetImage('assets/IMG_4364-Photoroom.png'),
              ),
              title: Text(
                data.name!,
                style: TextStyle(color: Colors.amber),
              ),
            );
          },
          itemCount: student.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
        );
}
