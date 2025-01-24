import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/app.dart';
import 'domain/model/pet/hive_pet_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(HivePetModelAdapter()); // Register the HivePetModel adapter
  await Hive.openBox<HivePetModel>('adopted_pets'); // Open a Hive box for HivePetModel
  runApp( const ProviderScope(child: MyApp()));


}


