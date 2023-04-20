// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:zadanie_rekrutacyjne/pets/models/pet_model.dart';

class PetsModel {
  final List<PetModel> pets;
  PetsModel({
    required this.pets,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pets': pets.map((x) => x.toMap()).toList(),
    };
  }

  factory PetsModel.fromMap(List<dynamic> listOfMaps) {
    return PetsModel(
      pets: List<PetModel>.from(
        listOfMaps.map<PetModel>(
          (x) => PetModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  static final empty = PetsModel(pets: []);

  factory PetsModel.fromJson(String source) =>
      PetsModel.fromMap(json.decode(source) as List<dynamic>);
}
