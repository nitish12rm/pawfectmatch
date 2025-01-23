import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/data/repository/pet_repository.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';
import 'package:pawfectmatch/utils/results.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/services/pet/pet_service.dart';
import '../../../domain/model/pet/hive_pet_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/data/repository/pet_repository.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';
import 'package:pawfectmatch/utils/results.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/services/pet/pet_service.dart';
import '../../../domain/model/pet/hive_pet_model.dart';
Map<String, String> breedToAnimalType = {
  "Golden Retriever": "Dog",
  "German Shepherd": "Dog",
  "Bulldog": "Dog",
  "Poodle": "Dog",
  "Beagle": "Dog",
  "Siberian Husky": "Dog",
  "Boxer": "Dog",
  "Dachshund": "Dog",
  "Shih Tzu": "Dog",
  "Chihuahua": "Dog",
  "Rottweiler": "Dog",
  "Great Dane": "Dog",
  "Pomeranian": "Dog",
  "Yorkshire Terrier": "Dog",
  "Labrador Retriever": "Dog",
  "French Bulldog": "Dog",
  "Cocker Spaniel": "Dog",
  "Pug": "Dog",
  "Saint Bernard": "Dog",
  "Border Collie": "Dog",
  "Bull Terrier": "Dog",
  "Maltese": "Dog",
  "Siamese Cat": "Cat",
  "Persian Cat": "Cat",
  "Bengal Cat": "Cat",
  "Parrot": "Bird",
  "Cockatiel": "Bird",
  "Rabbit": "Rabbit"
};
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

  // List of all pets (unfiltered)
  List<PetModel> _allPets = [];

  @override
  Future<Result<List<PetModel>>> build() async {
    // Fetch pets from JSON
    final jsonPetsResult = await _repository.getPets();

    if (jsonPetsResult is Ok<List<PetModel>>) {
      // Fetch adopted pets from Hive
      final adoptedPets = _adoptedPetsBox.values.toList();

      // Update the adoption status of JSON pets
      _allPets = jsonPetsResult.value.map((pet) {
        final isAdopted = _adoptedPetsBox.containsKey(pet.id);
        return pet.copyWith(isAdopted: isAdopted);
      }).toList();

      return Result.ok(_allPets); // Return the unfiltered list initially
    } else {
      return jsonPetsResult;
    }
  }
// Method to filter pets by name or breed
  Result<List<PetModel>> filterPets({
    String? searchQuery,
    int? minAge,
    int? maxAge,
    double? minPrice,
    double? maxPrice,
    String? breed, // This will now accept animal type (e.g., "Dog", "Cat", "Bird", "Rabbit")
  }) {
    // Start with the full list of pets
    var filteredPets = _allPets;

    // Apply search filter (name or breed)
    if (searchQuery != null && searchQuery.isNotEmpty) {
      // Check if the search query matches an animal type
      List<String> breedsForAnimalType = breedToAnimalType.entries
          .where((entry) => entry.value.toLowerCase() == searchQuery.toLowerCase())
          .map((entry) => entry.key)
          .toList();

      if (breedsForAnimalType.isNotEmpty) {
        // If the search query matches an animal type, filter by breeds for that type
        filteredPets = filteredPets
            .where((pet) => breedsForAnimalType.contains(pet.breed))
            .toList();
      } else {
        // Otherwise, fall back to the original search logic (name or breed)
        filteredPets = filteredPets.where((pet) {
          return pet.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              pet.breed.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
      }
    }


    // Apply age filter
    if (minAge != null) {
      filteredPets = filteredPets.where((pet) => pet.age >= minAge).toList();
    }
    if (maxAge != null) {
      filteredPets = filteredPets.where((pet) => pet.age <= maxAge).toList();
    }

    // Apply price filter
    if (minPrice != null) {
      filteredPets = filteredPets.where((pet) => pet.price >= minPrice).toList();
    }
    if (maxPrice != null) {
      filteredPets = filteredPets.where((pet) => pet.price <= maxPrice).toList();
    }

    // Apply breed filter (now based on animal type)
    if (breed != null && breed.isNotEmpty) {
      // Get all breeds for the given animal type
      List<String> breedsForAnimalType = breedToAnimalType.entries
          .where((entry) => entry.value.toLowerCase() == breed.toLowerCase())
          .map((entry) => entry.key)
          .toList();

      // Filter pets based on the breeds
      filteredPets = filteredPets
          .where((pet) => breedsForAnimalType.contains(pet.breed))
          .toList();
    }

    return Result.ok(filteredPets);
  }
  // Method to filter pets by name or breed


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
      _allPets = result.value.map((pet) {
        final isAdopted = _adoptedPetsBox.containsKey(pet.id);
        return pet.copyWith(isAdopted: isAdopted);
      }).toList();

      // Update the state with the new result
      state = AsyncValue.data(Result.ok(_allPets));
    } else {
      state = AsyncValue.data(result);
    }
  }

  // Method to adopt a pet
  Future<void> adoptPet(PetModel pet) async {
    // Mark the pet as adopted in Hive
    final hivePet = HivePetModel(
      id: pet.id,
      name: pet.name,
      isAdopted: true,
      age: pet.age,
      price: pet.price,
      breed: pet.breed,
      imageUrl: pet.imageUrl,
    );
    await _adoptedPetsBox.put(pet.id, hivePet);

    // Refresh the pets list to update the UI
    await refreshPets();
  }
}

// Provider for PetViewModel
final petViewModelProvider = AsyncNotifierProvider<PetViewModel, Result<List<PetModel>>>(() {
  return PetViewModel();
});