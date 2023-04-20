import 'dart:convert';

class PetModel {
  PetModel({
    required this.name,
    this.breed,
  });

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      name: map['name'] as String,
      breed: map['breed'] != null ? map['breed'] as String : null,
    );
  }
  final String name;
  final String? breed;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'breed': breed,
    };
  }
}
