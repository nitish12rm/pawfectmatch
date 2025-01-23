import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/pet/pet_model.dart';
import '../view_model/adopt_viewmodel.dart';

class AdoptionHistoryScreen extends ConsumerWidget {
  const AdoptionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(petAdoptionViewModelProvider.notifier);
    // Fetch the adopted pets and reverse the list
    final adoptedPets = viewModel.getAdoptedPets().reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adoption History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: adoptedPets.length,
          itemBuilder: (context, index) {
            final pet = adoptedPets[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: pet.imageUrl.isNotEmpty
                      ? NetworkImage(pet.imageUrl.first)
                      : null,
                  child: pet.imageUrl.isEmpty
                      ? const Icon(Icons.pets, size: 30)
                      : null,
                ),
                title: Text(
                  pet.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      'Breed: ${pet.breed}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Text(
                    //   'Adopted on: ${pet.adoptionDate}', // Assuming you have an adoptionDate field
                    //   style: TextStyle(
                    //     color: Colors.grey[600],
                    //     fontSize: 14,
                    //   ),
                    // ),
                  ],
                ),
                trailing: Text(
                  '\$${pet.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}