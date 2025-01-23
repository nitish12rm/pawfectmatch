import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/model/pet/hive_pet_model.dart';
import '../../../domain/model/pet/pet_model.dart';


class PetAdoptionRepository {
  // Get the Hive box for pets
  Box<HivePetModel> get _petsBox => Hive.box<HivePetModel>('pets');

  // Adopt a pet
  Future<void> adoptPet(PetModel pet) async {
    final hivePet = HivePetModel.fromPetModel(pet);
    hivePet.isAdopted = true; // Mark the pet as adopted
    await _petsBox.put(hivePet.id, hivePet); // Save the updated pet
  }

  // Fetch all pets
  List<PetModel> getPets() {
    return _petsBox.values.map((hivePet) => hivePet.toPetModel()).toList();
  }

  // Fetch adopted pets
  List<PetModel> getAdoptedPets() {
    return _petsBox.values
        .where((hivePet) => hivePet.isAdopted)
        .map((hivePet) => hivePet.toPetModel())
        .toList();
  }

  // Remove a pet by its ID
  Future<void> removePet(String petId) async {
    await _petsBox.delete(petId);
  }
}