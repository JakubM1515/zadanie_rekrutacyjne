import 'package:zadanie_rekrutacyjne/pets/api/pets_api.dart';
import 'package:zadanie_rekrutacyjne/pets/models/pets_model.dart';

class PetsRepository {
  final PetsAPI _petsApi = PetsAPI();
  Future<PetsModel> getPets() async {
    try {
      final rawPets = await _petsApi.getRawPets();
      final pets = PetsModel.fromJson(rawPets);
      return pets;
    } catch (e) {
      throw Exception(e);
    }
  }
}
