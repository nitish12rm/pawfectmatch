import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfectmatch/domain/model/pet/pet_model.dart';

import '../../../core/constants/color_constants.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<PetModel> pets;
  final String query;

  const SearchResultsScreen({Key? key, required this.pets, required this.query})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
title: Text(query),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: GridView.builder(gridDelegate:

        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,

        ),itemCount: pets.length,
            itemBuilder: (context,index){
          final pet = pets[index];
              return Container(
                decoration: BoxDecoration(
                  color: ColorConstants.offWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(),
                    // Name and Breed
                    Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 20),
                  child: Column(
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

                        pet.breed,
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
                  )),
                  ],
                ),
              );
            }),
      )
    );
  }
}