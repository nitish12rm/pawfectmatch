import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'domain/model/pet/hive_pet_model.dart';
import 'features/home/view/home_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(HivePetModelAdapter()); // Register the HivePetModel adapter
  await Hive.openBox<HivePetModel>('adopted_pets'); // Open a Hive box for HivePetModel
  runApp( const ProviderScope(child: MyApp()));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  PetListScreen()
    );
  }
}
