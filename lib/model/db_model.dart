
import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId:0)

class MyStudents {
  @HiveField(0)
 final String? name;

  @HiveField(1)
  final String? age;

  @HiveField(2)
  final String? cls;

  @HiveField(3)
  final String? address;

  @HiveField(4)
  final String? image; 

  MyStudents({required this.name,
  required this.age,
  required this.cls,
  required this.address,
  required this.image
  });
}

