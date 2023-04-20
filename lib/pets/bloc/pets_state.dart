// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pets_bloc.dart';

enum PetsStatus { loading, loaded, failure }

class PetsState extends Equatable {
  PetsState._({
    this.petsStatus = PetsStatus.loading,
    this.searchTerm = '',
    this.error = '',
    PetsModel? allPets,
  }) : allPets = allPets ?? PetsModel.empty;

  factory PetsState.loading() => PetsState._();
  factory PetsState.loaded(PetsModel pets) => PetsState._(
        allPets: pets,
        petsStatus: PetsStatus.loaded,
      );
  factory PetsState.failure(String error) => PetsState._(error: error);

  final PetsModel allPets;
  final PetsStatus petsStatus;
  final String searchTerm;
  final String error;

  PetsModel get filteredPets => allPets.copyWith(
        pets: allPets.pets
            .where(
              (pet) => pet.name.toLowerCase().contains(
                    searchTerm.toLowerCase(),
                  ),
            )
            .toList(),
      );

  @override
  List<Object> get props => [
        allPets,
        petsStatus,
        searchTerm,
        error,
      ];

  PetsState copyWith({
    PetsModel? allPets,
    PetsModel? filteredPets,
    PetsStatus? petsStatus,
    String? searchTerm,
    String? error,
  }) {
    return PetsState._(
      allPets: allPets ?? this.allPets,
      petsStatus: petsStatus ?? this.petsStatus,
      searchTerm: searchTerm ?? this.searchTerm,
      error: error ?? this.error,
    );
  }
}
