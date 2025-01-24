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
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: const Text(
          'Adoption History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),

        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body:adoptedPets.isEmpty?Center(child: Text("No Pets adopted yet"),): Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: adoptedPets.length,
          itemBuilder: (context, index) {
            final pet = adoptedPets[index];
            // Debugging: Print the image URL
            print('Image URL for ${pet.name}: ${pet.imageUrl[0]}');

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
                  backgroundImage: NetworkImage(pet.imageUrl[0]),
                  onBackgroundImageError: (exception, stackTrace) {
                    // Debugging: Print the error
                    print('Failed to load image: $exception');
                  },
                  child: pet.imageUrl[0].isEmpty
                      ? const Icon(Icons.pets, size: 30) // Fallback icon if URL is empty
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