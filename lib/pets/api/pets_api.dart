class PetsAPI {
  Future<String> getRawPets() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => '[{"name":"Atos", "breed":"York Shire"},'
          ' {"name":"Panko", "breed": "Shiba"},'
          ' {"name":"Cleo", "breed": "Pomeranian"}, {"name":"Max"}]',
    );
  }
}
