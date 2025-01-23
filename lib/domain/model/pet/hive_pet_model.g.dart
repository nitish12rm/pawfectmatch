// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_pet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePetModelAdapter extends TypeAdapter<HivePetModel> {
  @override
  final int typeId = 0;

  @override
  HivePetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HivePetModel(
      id: fields[0] as String,
      name: fields[1] as String,
      age: fields[2] as int,
      price: fields[3] as double,
      breed: fields[4] as String,
      imageUrl: (fields[5] as List).cast<String>(),
      isAdopted: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HivePetModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.breed)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.isAdopted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
