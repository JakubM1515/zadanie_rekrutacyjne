import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zadanie_rekrutacyjne/pets/models/pets_model.dart';
import 'package:zadanie_rekrutacyjne/pets/repository/pets_repository.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  PetsBloc({required this.petsRepository}) : super(PetsState()) {
    on<LoadTodos>((event, emit) async {
      emit(state.copyWith(petsStatus: PetsStatus.loading));
      try {
        final pets = await petsRepository.getPets();
        emit(
          state.copyWith(
            allPets: pets,
            filteredPets: pets,
            petsStatus: PetsStatus.loaded,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(petsStatus: PetsStatus.failure, error: e.toString()),
        );
      }
    });

    on<ChangeSearchTerm>((event, emit) {
      final pets = state.allPets.pets
          .where(
            (pet) => pet.name.toLowerCase().contains(
                  event.searchTerm.toLowerCase(),
                ),
          )
          .toList();

      emit(state.copyWith(filteredPets: PetsModel(pets: pets)));
    });
  }

  final PetsRepository petsRepository;
}
