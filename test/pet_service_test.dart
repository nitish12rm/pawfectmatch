import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // JSON string from the provided code
  const jsonString = '''
  {
    "pets": [
      {
        "id": "1",
        "name": "Buddy",
        "age": 2,
        "price": 100,
        "breed": "Golden Retriever",
        "imageUrl": [
          "https://heronscrossing.vet/wp-content/uploads/Golden-Retriever-1024x683.jpg",
          "https://images.ctfassets.net/m5ehn3s5t7ec/KtxCRW7y0LXNYcn6BHPPD/065b05bda2e516ea6a5887ce9856d1db/Golden_Retriever__Price.webp"
        ],
        "isAdopted": false
      }
    ]
  }
  ''';

  group('Pets JSON Parsing Tests', () {
    test('Should parse JSON string correctly', () {
      final parsedJson = jsonDecode(jsonString);
      expect(parsedJson, isA<Map<String, dynamic>>());

      // Validate that the 'pets' key exists and contains a list
      expect(parsedJson['pets'], isA<List>());

      // Check the first pet's details
      final firstPet = parsedJson['pets'][0];
      expect(firstPet['id'], '1');
      expect(firstPet['name'], 'Buddy');
      expect(firstPet['age'], 2);
      expect(firstPet['price'], 100);
      expect(firstPet['breed'], 'Golden Retriever');
      expect(firstPet['isAdopted'], false);

      // Validate the 'imageUrl' field
      expect(firstPet['imageUrl'], isA<List>());
      expect(firstPet['imageUrl'].length, 2);
      expect(firstPet['imageUrl'][0], startsWith('https://'));
    });

    test('All pets should have required fields', () {
      final parsedJson = jsonDecode(jsonString);
      final pets = parsedJson['pets'];

      for (var pet in pets) {
        expect(pet['id'], isNotNull);
        expect(pet['name'], isNotNull);
        expect(pet['age'], isNotNull);
        expect(pet['price'], isNotNull);
        expect(pet['breed'], isNotNull);
        expect(pet['imageUrl'], isA<List>());
        expect(pet['isAdopted'], isA<bool>());
      }
    });

    test('No pet should be adopted initially', () {
      final parsedJson = jsonDecode(jsonString);
      final pets = parsedJson['pets'];

      for (var pet in pets) {
        expect(pet['isAdopted'], false);
      }
    });
  });
}
