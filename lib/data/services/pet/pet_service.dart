// lib/features/home/data/repositories/pet_repository.dart
import 'dart:convert';

import '../../../domain/model/pet/pet_model.dart';
import '../../../utils/results.dart';
import '../../api/pet_json_constant.dart';

class PetService {
  Future<Result<List<PetModel>>> fetchPets() async {
    try{
      //simulating server
      await Future.delayed(Duration(seconds: 1));

      final jsonData = json.decode(jsonString);
      final petsList = jsonData['pets'] as List;

      return Result.ok(petsList.map((pet) => PetModel.fromJson(pet)).toList());
    }catch(e){
      return Result.error(Exception('Failed to fetch pets: $e'));
    }

  }
}