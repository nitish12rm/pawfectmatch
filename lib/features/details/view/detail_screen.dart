import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';

import '../../home/view_model/home_viewmodel.dart';

class PetDetailScreen extends ConsumerWidget {
  final PetModel pet;

  const PetDetailScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdopted = pet.isAdopted;

    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display pet image (first image in the list)
            if (pet.imageUrl.isNotEmpty)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(pet.imageUrl.first),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            // Display pet details
            Text(
              'Name: ${pet.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Age: ${pet.age} years'),
            const SizedBox(height: 10),
            Text('Breed: ${pet.breed}'),
            const SizedBox(height: 10),
            Text('Price: \$${pet.price.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            // Adopt button or "Adopted" text
            if (isAdopted)
              const Text(
                'Adopted',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              ElevatedButton(
                onPressed: () async {
                  // Call the adoptPet method from the ViewModel
                  await ref
                      .read(petViewModelProvider.notifier)
                      .adoptPet(pet);
                  // Show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${pet.name} has been adopted!'),
                    ),
                  );
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: const Text('Adopt'),
              ),
          ],
        ),
      ),
    );
  }
}