import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pawfectmatch/core/constants/color_constants.dart';
import 'package:confetti/confetti.dart';

import '../../../domain/model/pet/pet_model.dart';
import '../../home/view_model/home_viewmodel.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen(this.pet, {super.key});
  final PetModel pet;

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  // Confetti controller
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    // Initialize the confetti controller
    _confettiController = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    // Dispose the confetti controller to avoid memory leaks
    _confettiController.dispose();
    super.dispose();
  }
bool isAdopted=false;
  // Function to show the adoption success pop-up
  void _showAdoptionSuccessPopup()async {
    setState(() {
      isAdopted=true;
    });

    await ref
        .read(petViewModelProvider.notifier)
        .adoptPet(widget.pet);
    _confettiController.play(); // Play confetti animation

    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: const Text("Congratulations!"),
          content:  Text("You have now adopted ${widget.pet.name}!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    ).then((_) {
      _confettiController.stop(); // Stop confetti animation when dialog is closed
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if(!isAdopted)
isAdopted=widget.pet.isAdopted;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pet Details"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Image Section
              SizedBox(
                height: screenHeight * 0.4,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [

                    InteractiveViewer(
                      child: Center(
                        child: CarouselSlider.builder(
                          itemCount: widget.pet.imageUrl.length,
                          itemBuilder: (BuildContext context, int index, int realIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                widget.pet.imageUrl[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 400,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                          ),
                        ),
                      ),
                    ),
                    // Current image indicator
                    // Positioned(
                    //   bottom: 10,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: List.generate(3, (index) {
                    //       return Container(
                    //         margin: const EdgeInsets.symmetric(horizontal: 4),
                    //         width: 8,
                    //         height: 8,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: index == 0 ? Colors.blue : Colors.grey,
                    //         ),
                    //       );
                    //     }),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Pet Details Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          widget.pet.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFFFFFF3C9),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                     Text(
                      widget.pet.breed,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFFFFFF3C9),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person_pin,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "John Doe",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const Text(
                              "Pet Owner",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                             Text(
                              "${widget.pet.id} jan ${2025-widget.pet.age}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFFFFFF3C9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children:  [
                            SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Age",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "${widget.pet.age.toString()} years",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "${widget.pet.id} Kg",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "A pet is more than just a companion—they’re a living reminder of unconditional love. They greet you with excitement no matter how your day went, stay by your side when you feel low, and find joy in the simplest moments, teaching you to do the same. Their trust is pure, their loyalty unwavering, and their presence turns a house into a home.",
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
          // Confetti Animation
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
            ),
          ),
        ],
      ),
      // Bottom Bar with Adopt Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isAdopted?Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Adopted",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("🐾"),
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ):GestureDetector(
          onTap: () {
            // Add a subtle animation on tap
            Future.delayed(const Duration(milliseconds: 50), _showAdoptionSuccessPopup);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min, // Ensure the row takes only the required space
            children: [
              // Adopt Now Button
              Container(
                decoration: BoxDecoration(
                  color: ColorConstants.orange, // Assuming ColorConstants is defined
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    children: [
                      const Text(
                        "Adopt Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8), // Spacing between text and icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "🐾",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12), // Spacing between button and price
              // Price Display
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '\$${widget.pet.price}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12)
            ],
          ),
        )
      ),
    );
  }
}