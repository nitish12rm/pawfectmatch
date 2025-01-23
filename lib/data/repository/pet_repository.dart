import 'package:pawfectmatch/domain/model/pet/pet_model.dart';
import 'package:pawfectmatch/utils/results.dart';

import '../services/pet/pet_service.dart';

class PetRepository{
  //Dependency injection for pet services
  PetRepository({required PetService petService}): _petService=petService;
  final PetService _petService;

  //to cache the result
  List<PetModel>? _cachedData;

  Future <Result<List<PetModel>>> getPets() async{
    final result = await _petService.fetchPets();
    if(result is Ok<List<PetModel>>){
      //ok
      if(_cachedData==null){
        _cachedData=result.value;
        return Result.ok(result.value);
      }else{
        return Result.ok(_cachedData!);
      }
    }
    //error
    return result;

  }
}