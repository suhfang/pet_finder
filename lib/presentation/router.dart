
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/cubit/animal_cubit.dart';
import 'package:pet_finder/data/network_service.dart';
import 'package:pet_finder/data/repository.dart';
import 'package:pet_finder/presentation/find_pet_screen.dart';

class AppRouter {

  Repository? repository;
  AnimalCubit? animalCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    animalCubit = AnimalCubit(repository: repository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BlocProvider.value(
          value: animalCubit!,
          child:  FindPetScreen(),
        ));
      default:
        return null;
    }
  }
}