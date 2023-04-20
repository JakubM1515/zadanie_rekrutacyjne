part of 'pets_bloc.dart';

abstract class PetsEvent extends Equatable {
  const PetsEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends PetsEvent {}

class ChangeSearchTerm extends PetsEvent {
  const ChangeSearchTerm({required this.searchTerm});

  final String searchTerm;

  @override
  List<Object> get props => [searchTerm];
}
