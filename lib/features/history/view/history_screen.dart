import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/pet/pet_model.dart';
import '../view_model/adopt_viewmodel.dart';

class AdoptionHistoryScreen extends ConsumerWidget {
  const AdoptionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(petAdoptionViewModelProvider.notifier);
    // Fetch the adopted pets in chronological order
    final adoptedPets = viewModel.getAdoptedPets();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption History'),
      ),
      body: ListView.builder(
        itemCount: adoptedPets.length,
        itemBuilder: (context, index) {
          final pet = adoptedPets[index];
          return ListTile(
            leading: pet.imageUrl.isNotEmpty
                ? Image.network(pet.imageUrl.first)
                : const Icon(Icons.pets),
            title: Text(pet.name),
            subtitle: Text('Adopted on: ${pet.breed.toString()}'),
            trailing: Text('\$${pet.price}'),
          );
        },
      ),
    );
  }
}