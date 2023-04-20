import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanie_rekrutacyjne/l10n/l10n.dart';
import 'package:zadanie_rekrutacyjne/pets/bloc/pets_bloc.dart';
import 'package:zadanie_rekrutacyjne/pets/repository/pets_repository.dart';
import 'package:zadanie_rekrutacyjne/pets/view/pets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => PetsRepository(),
        child: BlocProvider(
          create: (context) =>
              PetsBloc(petsRepository: context.read<PetsRepository>())
                ..add(LoadTodos()),
          child: Pets(),
        ),
      ),
    );
  }
}
