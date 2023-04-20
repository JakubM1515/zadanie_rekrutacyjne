import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/pet_details/pet_details.dart';
import 'package:zadanie_rekrutacyjne/pets/bloc/pets_bloc.dart';

class Pets extends StatelessWidget {
  Pets({super.key});
  final searchTermController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              child: Text(
                'Pets Repository',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: _buildPetsCountText(),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 3,
            ),
            Expanded(
              child: _buildPetsList(),
            ),
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextField(
                  controller: searchTermController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    labelText: 'Wpisz nazwę',
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchTermController.clear();
                        context.read<PetsBloc>().add(
                              const ChangeSearchTerm(searchTerm: ''),
                            );
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (value) => context.read<PetsBloc>().add(
                        ChangeSearchTerm(searchTerm: value),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetsList() {
    return BlocBuilder<PetsBloc, PetsState>(
      builder: (context, state) {
        switch (state.petsStatus) {
          case PetsStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PetsStatus.failure:
            return Center(
              child: Text(state.error),
            );
          case PetsStatus.loaded:
            return ListView.separated(
              itemCount: state.filteredPets.pets.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.blue.shade500,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) =>
                  _petListTile(state, index, context),
            );
        }
      },
    );
  }

  ListTile _petListTile(PetsState state, int index, BuildContext context) {
    final pet = state.filteredPets.pets[index];
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetDetails(
            pet: pet,
          ),
        ),
      ),
      leading: const Icon(
        Icons.pets,
        color: Colors.black,
      ),
      title: Text(pet.name),
      subtitle: Text(pet.breed!),
    );
  }

  Widget _buildPetsCountText() {
    return BlocBuilder<PetsBloc, PetsState>(
      builder: (context, state) {
        switch (state.petsStatus) {
          case PetsStatus.loading:
            return const Text('Loading...');
          case PetsStatus.failure:
            return const Text('Ooops, something went wrong...');
          case PetsStatus.loaded:
            return Text('Nice, we found ${state.allPets.pets.length} pets');
        }
      },
    );
  }
}
