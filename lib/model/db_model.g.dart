// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyStudentsAdapter extends TypeAdapter<MyStudents> {
  @override
  final int typeId = 0;

  @override
  MyStudents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyStudents(
      name: fields[0] as String?,
      age: fields[1] as String?,
      cls: fields[2] as String?,
      address: fields[3] as String?,
      image: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyStudents obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.cls)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyStudentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
