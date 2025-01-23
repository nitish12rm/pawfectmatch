import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repository/database/hive_database.dart';
import '../../../domain/model/pet/pet_model.dart';

class PetAdoptionViewModel extends StateNotifier<List<PetModel>> {
  final PetAdoptionRepository _repository = PetAdoptionRepository();

  PetAdoptionViewModel() : super([]);

  // Fetch all pets
  void fetchPets() {
    state = _repository.getPets();
  }

  // Adopt a pet
  Future<void> adoptPet(PetModel pet) async {
    await _repository.adoptPet(pet);
    fetchPets(); // Refresh the list
  }

  // Fetch adopted pets
  List<PetModel> getAdoptedPets() {
    return _repository.getAdoptedPets();
  }

  // Remove a pet
  Future<void> removePet(String petId) async {
    await _repository.removePet(petId);
    fetchPets(); // Refresh the list
  }
}

// Provider for PetAdoptionViewModel
final petAdoptionViewModelProvider =
StateNotifierProvider<PetAdoptionViewModel, List<PetModel>>((ref) {
  return PetAdoptionViewModel();
});