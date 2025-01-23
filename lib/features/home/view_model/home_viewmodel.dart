import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/data/repository/pet_repository.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';
import 'package:pawfectmatch/utils/results.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/services/pet/pet_service.dart';
import '../../../domain/model/pet/hive_pet_model.dart';

// Provider for PetRepository
final petRepositoryProvider = Provider<PetRepository>((ref) {
  return PetRepository(petService: PetService());
});

// Provider for Hive Box (Adopted Pets)
final adoptedPetsBoxProvider = Provider<Box<HivePetModel>>((ref) {
  return Hive.box<HivePetModel>('adopted_pets');
});

// AsyncNotifier for PetViewModel
class PetViewModel extends AsyncNotifier<Result<List<PetModel>>> {
  // Get the repository instance
  PetRepository get _repository => ref.read(petRepositoryProvider);

  // Get the Hive box for adopted pets
  Box<HivePetModel> get _adoptedPetsBox => ref.read(adoptedPetsBoxProvider);

  @override
  Future<Result<List<PetModel>>> build() async {
    // Fetch pets from JSON
    final jsonPetsResult = await _repository.getPets();

    if (jsonPetsResult is Ok<List<PetModel>>) {
      // Fetch adopted pets from Hive
      final adoptedPets = _adoptedPetsBox.values.toList();

      // Update the adoption status of JSON pets
      final updatedPets = jsonPetsResult.value.map((pet) {
        final isAdopted = _adoptedPetsBox.containsKey(pet.id);
        return pet.copyWith(isAdopted: isAdopted);
      }).toList();

      return Result.ok(updatedPets);
    } else {
      return jsonPetsResult;
    }
  }

  // Method to refresh the pets data
  Future<void> refreshPets() async {
    // Set the state to loading
    state = const AsyncValue.loading();
    // Fetch new data
    final result = await _repository.getPets();

    if (result is Ok<List<PetModel>>) {
      // Fetch adopted pets from Hive
      final adoptedPets = _adoptedPetsBox.values.toList();

      // Update the adoption status of JSON pets
      final updatedPets = result.value.map((pet) {
        final isAdopted = _adoptedPetsBox.containsKey(pet.id);
        return pet.copyWith(isAdopted: isAdopted);
      }).toList();

      // Update the state with the new result
      state = AsyncValue.data(Result.ok(updatedPets));
    } else {
      state = AsyncValue.data(result);
    }
  }

  // Method to adopt a pet
  Future<void> adoptPet(PetModel pet) async {
    // Mark the pet as adopted in Hive
    final hivePet = HivePetModel(id: pet.id, name: pet.name, isAdopted: true, age: pet.age, price: pet.price, breed: pet.breed, imageUrl: pet.imageUrl);
    await _adoptedPetsBox.put(pet.id, hivePet);

    // Refresh the pets list to update the UI
    await refreshPets();
  }
}

// Provider for PetViewModel
final petViewModelProvider = AsyncNotifierProvider<PetViewModel, Result<List<PetModel>>>(() {
  return PetViewModel();
});