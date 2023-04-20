// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pets_bloc.dart';

enum PetsStatus { loading, loaded, failure }

class PetsState extends Equatable {
  PetsState({
    this.petsStatus = PetsStatus.loading,
    this.searchTerm = '',
    this.error = '',
    PetsModel? filteredPets,
    PetsModel? allPets,
  })  : allPets = allPets ?? PetsModel.empty,
        filteredPets = filteredPets ?? PetsModel.empty;

  final PetsModel allPets;
  final PetsModel filteredPets;
  final PetsStatus petsStatus;
  final String searchTerm;
  final String error;

  @override
  List<Object> get props => [
        allPets,
        petsStatus,
        searchTerm,
        error,
        filteredPets,
      ];

  PetsState copyWith({
    PetsModel? allPets,
    PetsModel? filteredPets,
    PetsStatus? petsStatus,
    String? searchTerm,
    String? error,
  }) {
    return PetsState(
      allPets: allPets ?? this.allPets,
      filteredPets: filteredPets ?? this.filteredPets,
      petsStatus: petsStatus ?? this.petsStatus,
      searchTerm: searchTerm ?? this.searchTerm,
      error: error ?? this.error,
    );
  }
}
