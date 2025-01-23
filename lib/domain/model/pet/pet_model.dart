class PetModel {
  final String id;
  final String name;
  final int age;
  final double price;
  final String breed;
  final List<String> imageUrl;
  final bool isAdopted;

  PetModel({
    required this.id,
    required this.name,
    required this.age,
    required this.price,
    required this.breed,
    required this.imageUrl,
    this.isAdopted = false,
  });
  PetModel copyWith({
    String? id,
    String? name,
    int? age,
    double? price,
    String? breed,
    List<String>? imageUrl,
    bool? isAdopted,
  }) {
    return PetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      price: price ?? this.price,
      breed: breed ?? this.breed,
      imageUrl: imageUrl ?? this.imageUrl,
      isAdopted: isAdopted ?? this.isAdopted,
    );
  }
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      price: json['price'].toDouble(),
      breed: json['breed'],
      imageUrl: List<String>.from(json['imageUrl']),
      isAdopted: json['isAdopted'],
    );
  }
}