import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';
import 'package:pawfectmatch/utils/results.dart';


import '../../details/view/detail_screen.dart';
import '../view_model/home_viewmodel.dart';

class PetListScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends ConsumerState<PetListScreen> {
  String _searchQuery = '';
  int? _minAge;
  int? _maxAge;
  double? _minPrice;
  double? _maxPrice;
  String? _selectedBreed;

  // Function to reset all filters
  void _resetFilters() {
    setState(() {
      _searchQuery = '';
      _minAge = null;
      _maxAge = null;
      _minPrice = null;
      _maxPrice = null;
      _selectedBreed = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final petsResult = ref.watch(petViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Pets'),
        actions: [
          // Reset button in the app bar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFilters,
            tooltip: 'Reset Filters',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, breed, or animal type...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Filter controls in a Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Age filter
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: _minAge,
                          hint: const Text('Min Age'),
                          items: List.generate(20, (index) => index + 1)
                              .map((age) => DropdownMenuItem(
                            value: age,
                            child: Text('$age years'),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _minAge = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: _maxAge,
                          hint: const Text('Max Age'),
                          items: List.generate(20, (index) => index + 1)
                              .map((age) => DropdownMenuItem(
                            value: age,
                            child: Text('$age years'),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _maxAge = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Price filter
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Min Price',
                            prefixIcon: const Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _minPrice = double.tryParse(value);
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Max Price',
                            prefixIcon: const Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _maxPrice = double.tryParse(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Breed filter
                  DropdownButtonFormField<String>(
                    value: _selectedBreed,
                    hint: const Text('Select Animal Type'),
                    items: const [
                      DropdownMenuItem(value: 'Dog', child: Text('Dog')),
                      DropdownMenuItem(value: 'Cat', child: Text('Cat')),
                      DropdownMenuItem(value: 'Bird', child: Text('Bird')),
                      DropdownMenuItem(value: 'Rabbit', child: Text('Rabbit')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedBreed = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Reset button
                  ElevatedButton.icon(
                    onPressed: _resetFilters,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset Filters'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pet list
          Expanded(
            child: petsResult.when(
              data: (result) {
                if (result is Ok<List<PetModel>>) {
                  // Filter pets based on the search query and filters
                  final filteredPets = ref
                      .read(petViewModelProvider.notifier)
                      .filterPets(
                    searchQuery: _searchQuery,
                    minAge: _minAge,
                    maxAge: _maxAge,
                    minPrice: _minPrice,
                    maxPrice: _maxPrice,
                    breed: _selectedBreed,
                  );

                  if (filteredPets is Ok<List<PetModel>>) {
                    final pets = filteredPets.value;

                    if (pets.isEmpty) {
                      return const Center(child: Text('No pets found.'));
                    }

                    return ListView.builder(
                      itemCount: pets.length,
                      itemBuilder: (context, index) {
                        final pet = pets[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(pet.imageUrl.first),
                            ),
                            title: Text(pet.name),
                            subtitle:
                            Text('Breed: ${pet.breed} - Age: ${pet.age}'),
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
                                    builder: (context) =>
                                        PetDetailScreen(pet: pet),
                                  ),
                                );
                              },
                              child: const Text('View Details'),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (filteredPets is Error<List<PetModel>>) {
                    return Center(child: Text('Error: ${filteredPets.error}'));
                  }
                } else if (result is Error<List<PetModel>>) {
                  return Center(child: Text('Error: ${result.error}'));
                }
                return const Center(child: Text('Unknown state'));
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}