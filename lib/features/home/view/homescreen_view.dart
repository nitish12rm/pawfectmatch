import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawfectmatch/core/constants/color_constants.dart';
import 'package:pawfectmatch/features/details/view/detailscreen_view.dart';
import 'package:pawfectmatch/features/home/view/search_screen_view.dart';
import '../../../domain/model/pet/pet_model.dart';
import '../../../utils/results.dart';
import '../view_model/home_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchQuery = '';
  int? _minAge;
  int? _maxAge;
  double? _minPrice;
  double? _maxPrice;
  String? _selectedBreed;
  int _currentPage = 1;
  final int _itemsPerPage = 10;

  // Add a TextEditingController for the search field
  final TextEditingController _searchController = TextEditingController();

  void _resetFilters() {
    setState(() {
      _searchQuery = '';
      _minAge = null;
      _maxAge = null;
      _minPrice = null;
      _maxPrice = null;
      _selectedBreed = null;
      _searchController.clear(); // Clear the search field
    });
  }
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter Settings'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  onPressed: () {
                    _resetFilters();
                    Navigator.of(context).pop(); // Close the dialog
                  },
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
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
  void _goToNextPage() {
    setState(() {
      _currentPage++;
    });
  }

  void _goToPreviousPage() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
      });
    }
  }

  // Handle search submission
  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      // Navigate to the search results screen
      final filteredPets =
      ref.read(petViewModelProvider.notifier).filterPets(
        searchQuery: query,
        minAge: _minAge,
        maxAge: _maxAge,
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        breed: _selectedBreed,
      );
      if (filteredPets is Ok<List<PetModel>>) {
        final pets = filteredPets.value;

        if (pets.isEmpty) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultsScreen(pets: pets, query: query,),
          ),
        );
      }

    }
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final petsResult = ref.watch(petViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Greeting AppBar (Fixed AppBar)
          SliverAppBar(
            backgroundColor: ColorConstants.orange,
            pinned: false,
            floating: false,
            expandedHeight: 0,
            title: const Text(
              "Hi, Nitish!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // Collapsible Section (Search Bar and Categories)
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 260,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar and Filter Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20.0),
                    child: Row(
                      children: [
                        // Search Bar
                        Expanded(
                          child: TextField(
                            controller: _searchController, // Add controller
                            decoration: InputDecoration(
                              hintText: 'Search by name, breed, or animal type...',
                              prefixIcon: const Icon(Icons.search, size: 25),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            onSubmitted: (query) => _onSearchSubmitted(query), // Handle "Enter"
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Filter Button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            icon: const Icon(Iconsax.setting_3, size: 25, color: Colors.white),
                            onPressed: () {
                              _showFilterDialog(context); // Open the filter dialog
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Categories Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: HeadingWidget(title: "Categories"),
                  ),
                  Container(
                    color: Colors.white,
                    height: 170,
                    child: GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.2,
                      ),
                      children: [
                        CategoryCard(
                          key: ValueKey('dog'),
                          title: 'Dog',
                          image: "assets/category/dog-face-svgrepo-com.svg",
                          color: Color(0XFFF6A8FFD), onTap:()=> _onSearchSubmitted("dog"),
                        ),
                        CategoryCard(
                          key: ValueKey('cat'),
                          title: 'Cat',
                          image: "assets/category/cat-face-svgrepo-com.svg",
                          color: Color(0XFFFFEDBD7),
                          onTap:()=> _onSearchSubmitted("cat"),
                        ),
                        CategoryCard(
                          key: ValueKey('bird'),
                          title: 'Bird',
                          image: "assets/category/bird-svgrepo-com.svg",
                          color: Color(0XFFFFFF3C9),
                          onTap:()=> _onSearchSubmitted("bird"),

                        ),
                        CategoryCard(
                          key: ValueKey('rabbit'),
                          title: 'Rabbit',
                          image: "assets/category/rabbit-svgrepo-com.svg",
                          color: Color(0XFFFEBFAE7),
                          onTap:()=> _onSearchSubmitted("rabbit"),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Recommended Pets Section
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 60.0,
              child: Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

          // Pets Grid View
          petsResult.when(
            data: (result) {
              if (result is Ok<List<PetModel>>) {
                final pets = result.value;
                if (pets.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No pets found.')),
                  );
                }

                // Pagination Logic
                final totalPages = (pets.length / _itemsPerPage).ceil();
                if (_currentPage > totalPages) {
                  _currentPage = totalPages;
                }

                final startIndex = (_currentPage - 1) * _itemsPerPage;
                final endIndex = startIndex + _itemsPerPage;
                final paginatedPets = pets.sublist(
                  startIndex,
                  endIndex < pets.length ? endIndex : pets.length,
                );

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  sliver: SliverGrid(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: paginatedPets.length,
                          (context, index) {
                        final pet = paginatedPets[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(pet)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.offWhite,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Match container border radius
                                    child: Image.network(
                                      pet.imageUrl[0],
                                      width: double.infinity, // Ensure the image takes full width
                                      fit: BoxFit.cover, // Ensure the image covers the entire space
                                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                        return Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                // Name and Breed
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pet.name,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            pet.breed.length > 12
                                                ? pet.breed.substring(0, 12)
                                                : pet.breed,
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '\$${pet.price.toString()}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: pet.isAdopted ? Colors.green : ColorConstants.orange,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            pet.isAdopted ? "Adopted" : "Details",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (result is Error<List<PetModel>>) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${result.error}')),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(child: Text('Unknown state')),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SliverToBoxAdapter(
              child: Center(child: Text('Error: $error')),
            ),
          ),

          // Pagination Controls
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _goToPreviousPage,
                    color: _currentPage > 1 ? Colors.orange : Colors.grey,
                  ),
                  Text(
                    'Page $_currentPage',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: _goToNextPage,
                    color: petsResult.when(
                      data: (result) {
                        if (result is Ok<List<PetModel>>) {
                          final totalPages =
                          (result.value.length / _itemsPerPage).ceil();
                          return _currentPage < totalPages
                              ? Colors.orange
                              : Colors.grey;
                        }
                        return Colors.grey;
                      },
                      loading: () => Colors.grey,
                      error: (error, stack) => Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.color, required this.onTap,
  });

  final String title, image;
  final Color color;
   final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 120,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color,
              ),
              padding: const EdgeInsets.all(25.0),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}