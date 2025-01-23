import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';


import '../../../utils/results.dart';
import '../../details/view/detail_screen.dart';
import '../view_model/home_viewmodel.dart';

class PetListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petsResult = ref.watch(petViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Pets'),
      ),
      body: petsResult.when(
        data: (result) {
          if (result is Ok<List<PetModel>>) {
            final pets = result.value;
            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(pet.imageUrl.first),
                  ),
                  title: Text(pet.name),
                  subtitle: Text('Breed: ${pet.breed} - Age: ${pet.age}'),
                  trailing: pet.isAdopted
                      ? const Text(
                    'Adopted',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      : ElevatedButton(
                    onPressed: () {
                      // Navigate to the PetDetailScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetailScreen(pet: pet),
                        ),
                      );
                    },
                    child: const Text('View Details'),
                  ),
                );
              },
            );
          } else if (result is Error<List<PetModel>>) {
            return Center(child: Text('Error: ${result.error}'));
          }
          return const Center(child: Text('Unknown state'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}