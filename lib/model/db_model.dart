
import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId:0)

class MyStudents {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? age;

  @HiveField(2)
  String? cls;

  @HiveField(3)
  String? address;

  @HiveField(4)
  String? image; 

  MyStudents({required this.name,
  required this.age,
  required this.cls,
  required this.address,
  this.image
  });
}

