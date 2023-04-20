import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zadanie_rekrutacyjne/pets/models/pets_model.dart';
import 'package:zadanie_rekrutacyjne/pets/repository/pets_repository.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  final PetsRepository petsRepository;
  
  PetsBloc({required this.petsRepository}) : super(PetsState.loading()) {
    on<LoadTodos>((event, emit) async {
      emit(PetsState.loading());
      try {
        final pets = await petsRepository.getPets();
        emit(PetsState.loaded(pets));
      } catch (e) {
        emit(
          PetsState.failure(
            e.toString(),
          ),
        );
      }
    });

    on<ChangeSearchTerm>((event, emit) {
      emit(state.copyWith(searchTerm: event.searchTerm));
    });
  }

}
