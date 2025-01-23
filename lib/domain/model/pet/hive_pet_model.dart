import 'package:hive/hive.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';

part 'hive_pet_model.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique typeId for Hive
class HivePetModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int age;

  @HiveField(3)
  double price;

  @HiveField(4)
  String breed;

  @HiveField(5)
  List<String> imageUrl;

  @HiveField(6)
  bool isAdopted;

  HivePetModel({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.breed,
    required this.imageUrl,
    this.isAdopted = false,
  });

  factory HivePetModel.fromPetModel(PetModel pet) {
    return HivePetModel(
      id: pet.id,
      name: pet.name,
      age: pet.age,
      price: pet.price,
      breed: pet.breed,
      imageUrl: pet.imageUrl,
      isAdopted: pet.isAdopted,
    );
  }
  PetModel toPetModel() {
    return PetModel(
      id: id,
      name: name,
      age: age,
      price: price,
      breed: breed,
      imageUrl: imageUrl,
      isAdopted: isAdopted,
    );
  }
}